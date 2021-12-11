module "repo_test" {
  source      = "./modules/repo"
  name        = "test-terraform-creation"
  description = "Test creating repositories with terraform."
  public      = true

  copyright_start_year = 2020
  copyright_holders    = ["Anonymous"]
}
