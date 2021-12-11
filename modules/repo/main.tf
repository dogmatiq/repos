resource "github_repository" "this" {
  archive_on_destroy = true

  name        = var.name
  description = var.description
  visibility  = var.public ? "public" : "private"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  vulnerability_alerts   = true

  dynamic "template" {
    for_each = var.template != null ? [null] : []
    content {
      owner      = "dogmatiq"
      repository = var.template
    }
  }
}

resource "github_repository_file" "license" {
  repository          = github_repository.this.name
  branch              = github_repository.this.default_branch
  file                = "LICENSE"
  commit_message      = "Update license based on Terraform configuration"
  overwrite_on_create = true
  content = templatefile(
    "${path.module}/license-template.txt",
    {
      start_year = var.copyright_start_year
      end_year   = formatdate("YYYY", timestamp())
      holders    = concat(["James Harris"], var.copyright_holders)
    }
  )
}
