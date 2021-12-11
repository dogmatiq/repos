module "repo_test" {
  source      = "./modules/repo"
  name        = "test-terraform-creation"
  description = "Test creating repositories with terraform."

  copyright_start_year = 2021
}
