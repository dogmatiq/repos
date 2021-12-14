module "repo_configkit" {
  source               = "./modules/repo"
  name                 = "configkit"
  description          = "Inspect, validate and visualize Dogma application configurations."
  public               = true
  copyright_start_year = 2019
  copyright_holders    = ["Danil Petrov"]
}

module "repo_dissolve" {
  source               = "./modules/repo"
  name                 = "dissolve"
  description          = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  public               = true
  copyright_start_year = 2019
}

module "repo_iago" {
  source               = "./modules/repo"
  name                 = "iago"
  description          = "IO utilities for Go."
  public               = true
  copyright_start_year = 2019
  template             = null
}

module "repo_kyu" {
  source               = "./modules/repo"
  name                 = "kyu"
  description          = "🚧 Queue data-structures for Go."
  public               = true
  copyright_start_year = 2020
  template             = null
}

module "repo_linger" {
  source               = "./modules/repo"
  name                 = "linger"
  description          = "Timeout and retry utilities for Go."
  public               = true
  copyright_start_year = 2019
}

module "repo_mobius" {
  source               = "./modules/repo"
  name                 = "mobius"
  description          = "🚧 A weighted consistent-hashing implementation for Go."
  public               = true
  copyright_start_year = 2019
}
