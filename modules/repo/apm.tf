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
        ["dogmatiq/agent-config/internal#^1.0.0"],
        var.apm_dependencies,
      )
    }
  )
}
