resource "github_repository" "test2" {
  name = "test-default-branch-creation"
}


resource "github_branch_default" "test2" {
  repository = github_repository.test2.name
  branch     = "main"
}
