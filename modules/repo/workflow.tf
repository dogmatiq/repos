locals {
  workflow = var.workflow == "(default)" ? var.languages[0] : var.workflow
}

resource "github_repository_file" "workflow_config" {
  count = local.workflow == null ? 0 : 1

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/ci.yml"
  commit_message      = "Update GitHub Actions configuration based on Terraform configuration"
  overwrite_on_create = true

  content = templatefile(
    "${path.module}/../../templates/workflow.yml.tftpl",
    {
      workflow = local.workflow
    }
  )
}
