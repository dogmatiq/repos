module "repo_aperture" {
  source               = "./modules/repo"
  name                 = "aperture"
  description          = "🚧 An intensely minimal projection-only Dogma engine."
  public               = true
  copyright_start_year = 2019
}

module "repo_browser" {
  source               = "./modules/repo"
  name                 = "browser"
  description          = "🚧 A web-based documentation server for inspecting Dogma applications."
  public               = true
  copyright_start_year = 2021
}

module "repo_cloud" {
  source               = "./modules/repo"
  name                 = "cloud"
  description          = "The easiest way to run Dogma applications in the cloud."
  copyright_start_year = 2021
}

module "repo_dissolve" {
  source               = "./modules/repo"
  name                 = "dissolve"
  description          = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  public               = true
  copyright_start_year = 2019
}

module "repo_dogma" {
  source               = "./modules/repo"
  name                 = "dogma"
  description          = "A specification and API for building message-based applications in Go."
  public               = true
  template             = null
  copyright_start_year = 2018
  copyright_holders    = ["Kevin Millar", "Danil Petrov"]
}

module "repo_dogmacli" {
  source               = "./modules/repo"
  name                 = "dogmacli"
  description          = "🚧 Command line tools for Dogma applications."
  public               = true
  copyright_start_year = 2020
}

module "repo_dogmavet" {
  source               = "./modules/repo"
  name                 = "dogmavet"
  description          = "🚧 A Go vet tool for checking Dogma application and handler implementations."
  public               = true
  copyright_start_year = 2020
}

module "repo_linger" {
  source               = "./modules/repo"
  name                 = "linger"
  description          = "Timeout and retry utilities for Go."
  public               = true
  copyright_start_year = 2019
}

module "repo_sqltest" {
  source               = "./modules/repo"
  name                 = "sqltest"
  description          = "🚧 Internal utilities for testing Dogma projects that use SQL databases."
  public               = true
  copyright_start_year = 2020
}

module "repo_veracity" {
  source               = "./modules/repo"
  name                 = "veracity"
  description          = "🚧 An event-sourced Dogma engine that uses an append-only journal for persistence."
  copyright_start_year = 2021
}

module "repo_verity" {
  source               = "./modules/repo"
  name                 = "verity"
  description          = "🚧 A scalable, event-sourced Dogma engine."
  public               = true
  copyright_start_year = 2019
}
