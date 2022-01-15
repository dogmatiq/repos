resource "github_repository_file" "publish_release_workflow_config" {
  count = local.publish_releases ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/publish-release.yml"
  overwrite_on_create = true
  commit_message      = <<-EOT
  Regenerate workflow configuration from template.

  This file is managed by the Terraform configuration at https://github.com/dogmatiq/repos,
  do not edit it manually!
  EOT

  content = templatefile(
    "${path.module}/../../templates/workflow-publish-release.yml.tftpl",
    {}
  )
}
