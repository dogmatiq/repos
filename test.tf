// resource "github_repository" "this" {
//   archive_on_destroy = true

//   name        = var.name
//   description = var.description
//   visibility  = var.private ? "private" : "public"

//   has_issues   = true
//   has_projects = false
//   has_wiki     = false

//   delete_branch_on_merge = true
//   allow_merge_commit     = true
//   allow_squash_merge     = false
//   allow_rebase_merge     = false
//   allow_auto_merge       = !var.private # not supported by private repos on free-tier

//   vulnerability_alerts = true

//   dynamic "template" {
//     for_each = local.template == null ? [] : [null]
//     content {
//       owner      = "dogmatiq"
//       repository = "template-${local.template}"
//     }
//   }
// }

// module "repo_test" {
//   source      = "./modules/repo"
//   name        = "test-release-publishing"
//   description = "Testing automated release publishing."
//   languages   = []

//   publish_releases = true

//   copyright = {
//     since = 2021
//   }
// }

// resource "github_branch_default" "this" {
//   repository = github_repository.this.name
//   branch     = "main"
// }
