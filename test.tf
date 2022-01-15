resource "github_repository" "test" {
  name = "test-default-branch-creation"
  template {
    owner      = "dogmatiq"
    repository = "template-go"
  }
}


resource "github_branch_default" "test" {
  repository = github_repository.test.name
  branch     = "main" # clashes with template
}
