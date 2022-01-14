resource "github_repository_file" "publish_release_workflow_config" {
  count = local.publish_releases ? 1 : 0

  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = ".github/workflows/publish-release.yml"
  commit_message      = "Update GitHub Actions configuration based on Terraform configuration"
  overwrite_on_create = true

  content = templatefile(
    "${path.module}/../../templates/workflow-publish-release.yml.tftpl",
    {}
  )
}
