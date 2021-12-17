locals {
  copyright = defaults(
    var.copyright,
    {},
  )
}

resource "github_repository" "this" {
  archive_on_destroy = true

  name        = var.name
  description = var.description
  visibility  = var.private ? "private" : "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false

  vulnerability_alerts = true

  dynamic "template" {
    for_each = var.omit_template ? [] : [null]
    content {
      owner      = "dogmatiq"
      repository = "template-${var.language}"
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
      start_year = local.copyright.since
      end_year   = "2021"
      holders    = concat(["James Harris"], local.copyright.holders)
    }
  )
}
