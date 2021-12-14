module "repo_cosyne" {
  source               = "./modules/repo"
  name                 = "cosyne"
  description          = "Context-aware synchronization primitives for Go."
  public               = true
  copyright_start_year = 2020
}

module "repo_dissolve" {
  source               = "./modules/repo"
  name                 = "dissolve"
  description          = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  public               = true
  copyright_start_year = 2019
}

module "repo_dosh" {
  source               = "./modules/repo"
  name                 = "dosh"
  description          = "🚧 A Go library for representing monetary values in-process and on-the-wire."
  public               = true
  copyright_start_year = 2021
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
