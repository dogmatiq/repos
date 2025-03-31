module "repo_aperture" {
  source      = "./modules/repo"
  name        = "aperture"
  description = "🚫 An intensely minimal projection-only Dogma engine."
  languages   = ["go"]
  archived    = true

  copyright = {
    since = 2019
    until = 2024 # archived
  }
}

module "repo_cosyne" {
  source      = "./modules/repo"
  name        = "cosyne"
  description = "🚫 Context-aware synchronization primitives for Go."
  languages   = ["go"]

  copyright = {
    since = 2020
  }
}

module "repo_dodeca" {
  source      = "./modules/repo"
  name        = "dodeca"
  description = "🚫 Utilities for 12-Factor applications written in Go."
  languages   = ["go"]
  template    = null
  archived    = true

  copyright = {
    since = 2019
    until = 2024 # archived
  }
}

module "repo_kyu" {
  source      = "./modules/repo"
  name        = "kyu"
  description = "🚫 Queue data-structures for Go."
  languages   = ["go"]

  copyright = {
    since = 2020
  }
}

module "repo_marshalkit" {
  source      = "./modules/repo"
  name        = "marshalkit"
  description = "🚫 Marshal and unmarshal Dogma messages and other types."
  languages   = ["go"]
  archived    = true

  copyright = {
    since = 2019
    until = 2024 # archived
  }
}

module "repo_mobius" {
  source      = "./modules/repo"
  name        = "mobius"
  description = "🚫 A weighted consistent-hashing implementation for Go."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}
