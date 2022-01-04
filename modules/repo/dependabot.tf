resource "github_repository_file" "dependabot_config" {
  count = length(var.languages) > 0 ? 1 : 0

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

resource "github_repository_file" "dependabot_workflow_config" {
  count = length(var.languages) > 0 && var.merge_dependabot_prs ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/dependabot.yml"
  commit_message      = "Update GitHub Actions configuration based on Terraform configuration"
  overwrite_on_create = true

  content = templatefile(
    "${path.module}/../../templates/workflow-dependabot.yml.tftpl",
    {
      workflow = local.workflow
    }
  )
}
