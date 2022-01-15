resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  overwrite_on_create = true
  commit_message      = <<-EOT
  Regenerate license from template.

  This file is managed by the Terraform configuration at https://github.com/dogmatiq/repos,
  do not edit it manually!
  EOT

  content = templatefile(
    "${path.module}/../../templates/LICENSE.tftpl",
    {
      start_year = local.copyright.since
      end_year   = "2021"
      holders    = concat(["James Harris"], local.copyright.holders)
    }
  )
}
