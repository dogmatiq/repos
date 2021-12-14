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

module "repo_configkit" {
  source               = "./modules/repo"
  name                 = "configkit"
  description          = "Inspect, validate and visualize Dogma application configurations."
  public               = true
  copyright_start_year = 2019
  copyright_holders    = ["Danil Petrov"]
}

module "repo_cloud" {
  source               = "./modules/repo"
  name                 = "cloud"
  description          = "The easiest way to run Dogma applications in the cloud."
  public               = false
  copyright_start_year = 2021
}

module "repo_discoverkit" {
  source               = "./modules/repo"
  name                 = "discoverkit"
  description          = "Discover running Dogma applications on the network."
  public               = true
  copyright_start_year = 2019
}

module "repo_dogma" {
  source               = "./modules/repo"
  name                 = "dogma"
  description          = "A specification and API for building message-based applications in Go."
  public               = true
  copyright_start_year = 2018
  copyright_holders    = ["Kevin Millar", "Danil Petrov"]
  template             = null
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

module "repo_projectionkit" {
  source               = "./modules/repo"
  name                 = "projectionkit"
  description          = "Build Dogma projections using popular database systems."
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
  public               = false
  copyright_start_year = 2021
}

module "repo_verity" {
  source               = "./modules/repo"
  name                 = "verity"
  description          = "🚧 A scalable, event-sourced Dogma engine."
  public               = true
  copyright_start_year = 2019
}
