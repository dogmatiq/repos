module "repo_cosyne" {
  source      = "./modules/repo"
  name        = "cosyne"
  description = "Context-aware synchronization primitives for Go."
  languages   = ["go"]

  copyright = {
    since = 2020
  }
}

module "repo_dapper" {
  source      = "./modules/repo"
  name        = "dapper"
  description = "A pretty-printer for Go values with minimalistic output."
  languages   = ["go"]
  template    = null

  copyright = {
    since = 2019
  }
}

module "repo_dissolve" {
  source      = "./modules/repo"
  name        = "dissolve"
  description = "🚧 A DNS-SD, Multicast DNS and Zeroconf/Bonjour toolkit for Go."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_dodeca" {
  source      = "./modules/repo"
  name        = "dodeca"
  description = "Utilities for 12-Factor applications written in Go."
  languages   = ["go"]
  template    = null

  copyright = {
    since = 2019
  }
}

module "repo_dosh" {
  source      = "./modules/repo"
  name        = "dosh"
  description = "🚧 A Go library for representing monetary values in-process and on-the-wire."
  languages   = ["go"]

  copyright = {
    since = 2021
  }
}

module "repo_harpy" {
  source      = "./modules/repo"
  name        = "harpy"
  description = "🚧 A transport-agnostic JSON-RPC v2 server toolkit for Go."
  languages   = ["go"]
  template    = null

  copyright = {
    since = 2020
  }
}

module "repo_iago" {
  source      = "./modules/repo"
  name        = "iago"
  description = "IO utilities for Go."
  languages   = ["go"]
  template    = null

  copyright = {
    since = 2019
  }
}

module "repo_imbue" {
  source      = "./modules/repo"
  name        = "imbue"
  description = "🚧 Yet another dependency injection container for Go."
  languages   = ["go"]

  copyright = {
    since = 2022
  }
}


module "repo_kyu" {
  source      = "./modules/repo"
  name        = "kyu"
  description = "🚧 Queue data-structures for Go."
  languages   = ["go"]

  copyright = {
    since = 2020
  }
}

module "repo_linger" {
  source      = "./modules/repo"
  name        = "linger"
  description = "Timeout and retry utilities for Go."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_mobius" {
  source      = "./modules/repo"
  name        = "mobius"
  description = "🚧 A weighted consistent-hashing implementation for Go."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_protean" {
  source      = "./modules/repo"
  name        = "protean"
  description = "🚧 A Protocol Buffers RPC framework for Go, consumable from the browser using standard APIs."
  languages   = ["go"]

  copyright = {
    since = 2021
  }
}
