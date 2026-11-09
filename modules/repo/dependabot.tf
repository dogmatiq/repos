locals {
  # Dependabot waits 3 days before proposing a new release of a dependency (its
  # "cooldown"). There is nothing to wait out for our own packages, so these
  # patterns exempt them, per ecosystem.
  dependabot_cooldown_exclusions = {
    apm   = ["dogmatiq/*"]
    gomod = ["github.com/dogmatiq/*"]
    npm   = ["@dogmatiq/*"]
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
      cooldown_exclusions = local.dependabot_cooldown_exclusions
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
