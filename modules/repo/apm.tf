locals {
  # The dogmatiq/agent-config release in each repository's apm.yml. Dependabot
  # bumps it to newer releases, using the "apm" ecosystem in dependabot.yml.
  #
  # TODO: Remove the pilot override for dapper, which starts on an older release
  # so that Dependabot has a newer one to bump to.
  apm_agent_config_ref = var.name == "dapper" ? "v1.0.0" : "v1.1.0"
}

resource "github_repository_file" "apm_config" {
  count = local.enable_apm ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "apm.yml"
  overwrite_on_create = true
  commit_author       = module.github.commit_author.name
  commit_email        = module.github.commit_author.email
  commit_message      = "Regenerate APM configuration from template."

  content = templatefile(
    "${path.module}/../../templates/apm.yml.tftpl",
    {
      name = github_repository.this.name
      dependencies = concat(
        ["dogmatiq/agent-config/internal#${local.apm_agent_config_ref}"],
        var.apm_dependencies,
      )
    }
  )
}
