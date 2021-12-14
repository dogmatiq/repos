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

module "repo_linger" {
  source               = "./modules/repo"
  name                 = "linger"
  description          = "Timeout and retry utilities for Go."
  public               = true
  copyright_start_year = 2019
}
