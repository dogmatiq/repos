variable "_dependabot_experiment" {
  type    = bool
  default = false
}

resource "github_repository_file" "dependabot_config" {
  count = var._dependabot_experiment && length(var.languages) > 0 ? 1 : 0

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
        contains(var.languages, "go") ? "gomod" : "",
        contains(var.languages, "js") ? "npm" : "",
      ])
    }
  )
}
