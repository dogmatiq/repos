resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  overwrite_on_create = true
  commit_author       = local.commit_author
  commit_email        = local.commit_email
  commit_message      = "Regenerate license from template."

  content = templatefile(
    "${path.module}/../../templates/LICENSE.tftpl",
    {
      start_year = local.copyright.since
      end_year   = "2021"
      holders    = concat(["James Harris"], local.copyright.holders)
    }
  )
}
