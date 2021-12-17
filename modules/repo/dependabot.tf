variable "_dependabot_experiment" {
  type    = bool
  default = false
}

resource "github_repository_file" "dependabot_config" {
  count = var._dependabot_experiment && var.language != null ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/dependabot.yml"
  commit_message      = "Update Dependabot configuration based on Terraform configuration"
  overwrite_on_create = true

  content = templatefile(
    "${path.module}/../../templates/dependabot.yml.tftpl",
    {
      ecosystems = compact([
        "github-actions",
        var.language == "go" ? "gomod" : "",
      ])
    }
  )
}
