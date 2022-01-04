locals {
  template                    = var.template == "(default)" ? var.languages[0] : var.template
  enable_dependabot           = length(var.languages) > 0
  enable_dependabot_automerge = local.enable_dependabot && var.merge_dependabot_prs && !var.private
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
  allow_auto_merge       = local.enable_dependabot_automerge

  vulnerability_alerts = true

  dynamic "template" {
    for_each = local.template == null ? [] : [null]
    content {
      owner      = "dogmatiq"
      repository = "template-${local.template}"
    }
  }
}

# resource "github_branch_protection" "default" {
#   count = local.merge_dependabot_prs ? 1 : 0

#   repository_id = github_repository.this.node_id
#   pattern       = github_repository.this.default_branch

#   required_status_checks {
#     strict   = false
#     contexts = ["xxx"]
#   }
# }
