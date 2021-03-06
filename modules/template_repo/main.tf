resource "github_repository" "this" {
  archive_on_destroy = true

  name        = var.name
  description = var.description

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false

  vulnerability_alerts = true

  is_template = true
}
