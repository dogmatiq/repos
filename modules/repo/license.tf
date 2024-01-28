resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  overwrite_on_create = true
  commit_author       = module.github.commit_author.name
  commit_email        = module.github.commit_author.email
  commit_message      = "Regenerate license from template."

  content = templatefile(
    "${path.module}/../../templates/LICENSE.tftpl",
    {
      start_year = var.copyright.since
      end_year   = formatdate("YYYY", plantimestamp())
      holders    = concat(["James Harris"], var.copyright.holders)
    }
  )
}
