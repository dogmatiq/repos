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
  allow_auto_merge       = !var.private # not supported by private repos on free-tier

  vulnerability_alerts = true

  auto_init = local.template == null # make sure there is always a default branch

  dynamic "template" {
    for_each = local.template == null ? [] : [null]
    content {
      owner      = "dogmatiq"
      repository = "template-${local.template}"
    }
  }
}
