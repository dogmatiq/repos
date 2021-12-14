module "repo_dogma" {
  source      = "./modules/repo"
  name        = "dogma"
  description = "A specification and API for building message-based applications in Go."
  public      = true
  template    = null

  copyright_start_year = 2018
  copyright_holders    = ["Kevin Millar", "Danil Petrov"]
}

module "repo_cloud" {
  source      = "./modules/repo"
  name        = "cloud"
  description = "The easiest way to run Dogma applications in the cloud."

  copyright_start_year = 2021
}
