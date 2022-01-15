resource "github_repository" "test3" {
  name      = "test-default-branch-creation"
  auto_init = true
}


resource "github_branch_default" "test3" {
  repository = github_repository.test3.name
  branch     = "main"
}
