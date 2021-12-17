locals {
  template = var.template == "(default)" ? var.languages[0] : var.template
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
    for_each = local.template == null ? [] : [null]
    content {
      owner      = "dogmatiq"
      repository = "template-${local.template}"
    }
  }
}
