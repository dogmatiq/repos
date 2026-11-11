locals {
  # Dependabot waits 3 days before proposing a new release of a dependency (its
  # "cooldown"). There is nothing to wait out for our own packages, so these
  # patterns exempt them, per ecosystem.
  dependabot_cooldown_exclusions = {
    apm   = ["dogmatiq/*"]
    gomod = ["github.com/dogmatiq/*"]
    npm   = ["@dogmatiq/*"]
  }

  # Minor and patch updates to these dependencies are merged automatically by
  # the shared Dependabot workflow. They are grouped into a single
  # "pre-approved" pull request per ecosystem, so that related updates (e.g. the
  # various golang.org/x/* modules) land together instead of as a flurry of
  # separate pull requests.
  #
  # Keep this list in sync with the conditions in
  # .github/workflows/shared-dependabot.yml, which still matches these names
  # individually for pull requests that are not part of the group, such as
  # security updates.
  dependabot_pre_approved_patterns = {
    apm = ["dogmatiq/*"]
    gomod = [
      "github.com/aws/*",
      "github.com/dogmatiq/*",
      "github.com/mattn/go-sqlite3",
      "github.com/onsi/*",
      "github.com/testcontainers/*",
      "go.etcd.io/bbolt",
      "go.opentelemetry.io/*",
      "golang.org/x/*",
      "google.golang.org/grpc",
      "google.golang.org/protobuf",
      "k8s.io/*",
    ]
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
