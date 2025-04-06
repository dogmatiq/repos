module "repo_aperture" {
  source         = "./modules/repo"
  name           = "aperture"
  description    = "🚫 An intensely minimal projection-only Dogma engine."
  languages      = ["go"]
  archive_status = "archiving"

  copyright = {
    since = 2019
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
  source         = "./modules/repo"
  name           = "dodeca"
  description    = "🚫 Utilities for 12-Factor applications written in Go."
  languages      = ["go"]
  template       = null
  archive_status = "archiving"

  copyright = {
    since = 2019
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
  source         = "./modules/repo"
  name           = "marshalkit"
  description    = "🚫 Marshal and unmarshal Dogma messages and other types."
  languages      = ["go"]
  archive_status = "archiving"

  copyright = {
    since = 2019
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
