resource "github_repository_file" "test_commit_details" {
  repository     = ".github"
  branch         = "main"
  file           = "test-committer.txt"
  content        = "test"
  commit_message = "Testing GitHub app commit author details."
}
