resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  commit_message      = "Update license based on Terraform configuration"
  overwrite_on_create = true

  content = templatefile(
    "${path.module}/../../templates/LICENSE.tftpl",
    {
      start_year = local.copyright.since
      end_year   = "2021"
      holders    = concat(["James Harris"], local.copyright.holders)
    }
  )
}
