module "repo_cloud" {
  source      = "./modules/repo"
  name        = "cloud"
  description = "The easiest way to run Dogma applications in the cloud."

  copyright_start_year = 2021
}

module "repo_dissolve" {
  source      = "./modules/repo"
  name        = "dissolve"
  description = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  public      = true

  copyright_start_year = 2019
}

module "repo_dogma" {
  source      = "./modules/repo"
  name        = "dogma"
  description = "A specification and API for building message-based applications in Go."
  public      = true
  template    = null

  copyright_start_year = 2018
  copyright_holders    = ["Kevin Millar", "Danil Petrov"]
}

module "repo_veracity" {
  source      = "./modules/repo"
  name        = "veracity"
  description = "🚧 An event-sourced Dogma engine that uses an append-only journal for persistence."

  copyright_start_year = 2021
}

module "repo_verity" {
  source      = "./modules/repo"
  name        = "verity"
  description = "🚧 A scalable, event-sourced Dogma engine."
  public      = true

  copyright_start_year = 2019
}
