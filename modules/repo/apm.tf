locals {
  # The dogmatiq/agent-config release that a new repository's apm.yml starts on.
  # After that, Dependabot bumps it, using the "apm" ecosystem in
  # dependabot.yml. Update it when releasing, so new repositories start on the
  # latest release.
  apm_agent_config_ref = "v1.1.0"
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

  # Dependabot bumps the release tags in apm.yml, so Terraform only writes the
  # file when it creates it. Otherwise each apply would revert those bumps.
  lifecycle {
    ignore_changes = [content]
  }
}
