module "repo_cloud" {
  source      = "./modules/repo"
  name        = "cloud"
  description = "The easiest way to run Dogma applications in the cloud."

  copyright_start_year = 2021
}
