module "repo_cosyne" {
  source               = "./modules/repo"
  name                 = "cosyne"
  description          = "Context-aware synchronization primitives for Go."
  template             = "go"
  copyright_start_year = 2020
}

module "repo_dapper" {
  source               = "./modules/repo"
  name                 = "dapper"
  description          = "A pretty-printer for Go values with minimalistic output."
  template             = null
  copyright_start_year = 2019
}

module "repo_dissolve" {
  source               = "./modules/repo"
  name                 = "dissolve"
  description          = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  template             = "go"
  copyright_start_year = 2019
}

module "repo_dodeca" {
  source               = "./modules/repo"
  name                 = "dodeca"
  description          = "Utilities for 12-Factor applications written in Go."
  template             = null
  copyright_start_year = 2019
}

module "repo_dosh" {
  source               = "./modules/repo"
  name                 = "dosh"
  description          = "🚧 A Go library for representing monetary values in-process and on-the-wire."
  template             = "go"
  copyright_start_year = 2021
}

module "repo_harpy" {
  source               = "./modules/repo"
  name                 = "harpy"
  description          = "🚧 A transport-agnostic JSON-RPC v2 server toolkit for Go."
  template             = null
  copyright_start_year = 2020
}

module "repo_iago" {
  source               = "./modules/repo"
  name                 = "iago"
  description          = "IO utilities for Go."
  template             = null
  copyright_start_year = 2019
}

module "repo_kyu" {
  source               = "./modules/repo"
  name                 = "kyu"
  description          = "🚧 Queue data-structures for Go."
  template             = "go"
  copyright_start_year = 2020
}

module "repo_linger" {
  source               = "./modules/repo"
  name                 = "linger"
  description          = "Timeout and retry utilities for Go."
  template             = "go"
  copyright_start_year = 2019
}

module "repo_mobius" {
  source               = "./modules/repo"
  name                 = "mobius"
  description          = "🚧 A weighted consistent-hashing implementation for Go."
  template             = "go"
  copyright_start_year = 2019
}

module "repo_protean" {
  source               = "./modules/repo"
  name                 = "protean"
  description          = "🚧 A Protocol Buffers RPC framework for Go, consumable from the browser using standard APIs."
  template             = "go"
  copyright_start_year = 2021
}
