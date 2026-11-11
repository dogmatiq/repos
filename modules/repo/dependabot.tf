locals {
  # Dependabot waits 3 days before proposing a new release of a dependency (its
  # "cooldown"). There is nothing to wait out for our own packages, so these
  # patterns exempt them, per ecosystem.
  dependabot_cooldown_exclusions = {
    apm   = ["dogmatiq/*"]
    gomod = ["github.com/dogmatiq/*"]
    npm   = ["@dogmatiq/*"]
  }

  # Minor and patch updates to these dependencies are grouped into a single
  # "pre-approved" pull request per ecosystem, which the shared Dependabot
  # workflow merges automatically. Security updates get their own
  # "pre-approved-security" group, since a Dependabot group applies to either
  # version updates or security updates, but not both.
  #
  # This is the only place the list is defined; the workflow only checks the
  # name of the group.
  dependabot_pre_approved_patterns = {
    apm = ["dogmatiq/*"]
    gomod = [
      "github.com/aws/*",
      "github.com/dogmatiq/*",
      "github.com/jackc/pgx/*",
      "github.com/mattn/go-sqlite3",
      "github.com/onsi/*",
      "github.com/testcontainers/*",
      "go.etcd.io/*",
      "go.opentelemetry.io/*",
      "golang.org/x/*",
      "google.golang.org/*",
      "k8s.io/*",
    ]
    npm = ["@dogmatiq/*"]
  }
}

resource "github_repository_file" "dependabot_config" {
  count = local.enable_dependabot ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/dependabot.yml"
  overwrite_on_create = true
  commit_author       = module.github.commit_author.name
  commit_email        = module.github.commit_author.email
  commit_message      = "Regenerate Dependabot configuration from template."

  content = templatefile(
    "${path.module}/../../templates/dependabot.yml.tftpl",
    {
      cooldown_exclusions   = local.dependabot_cooldown_exclusions
      pre_approved_patterns = local.dependabot_pre_approved_patterns
      ecosystems = compact([
        "github-actions",
        contains(var.languages, "go") ? "gomod" : "",
        contains(var.languages, "js") ? "npm" : "",
        local.enable_apm ? "apm" : "",
      ])
    }
  )
}

resource "github_repository_file" "dependabot_workflow_config" {
  count = local.enable_dependabot_auto_merge ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/dependabot.yml"
  overwrite_on_create = true
  commit_author       = module.github.commit_author.name
  commit_email        = module.github.commit_author.email
  commit_message      = "Regenerate workflow configuration from template."

  content = templatefile(
    "${path.module}/../../templates/workflow-dependabot.yml.tftpl",
    {}
  )
}
