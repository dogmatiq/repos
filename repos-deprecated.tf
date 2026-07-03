module "repo_aperture" {
  source         = "./modules/repo"
  name           = "aperture"
  description    = "🚫 An intensely minimal projection-only Dogma engine."
  languages      = ["go"]
  archive_status = "archived"

  copyright = {
    since = 2019
  }
}

module "repo_browser" {
  source         = "./modules/repo"
  name           = "browser"
  description    = "🚫 A web-based documentation server for inspecting Dogma applications."
  languages      = ["go"]
  archive_status = "archived"

  copyright = {
    since = 2021
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
  archive_status = "archived"

  copyright = {
    since = 2019
  }
}

module "repo_dogmacli" {
  source         = "./modules/repo"
  name           = "dogmacli"
  description    = "🚫 Command line tools for Dogma applications."
  languages      = ["go"]
  archive_status = "archived"

  copyright = {
    since = 2020
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
  archive_status = "archived"

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

module "repo_reference_engine" {
  source         = "./modules/repo"
  name           = "reference-engine"
  description    = "An reference implementation of a Dogma engine."
  languages      = ["go"]
  private        = true
  archive_status = "archiving"

  copyright = {
    since = 2026
  }
}

module "repo_verity" {
  source         = "./modules/repo"
  name           = "verity"
  description    = "🚫 An event-sourced Dogma engine."
  languages      = ["go"]
  archive_status = "archived"

  workflow = {
    services = [
      "postgres",
      "mysql",
      "mariadb",
    ]
  }

  copyright = {
    since = 2019
  }
}

module "repo_veracity" {
  source         = "./modules/repo"
  name           = "veracity"
  description    = "🚫 A horizontally-scalable event-sourced Dogma engine."
  languages      = ["go"]
  archive_status = "archived"

  copyright = {
    since = 2021
  }
}

module "repo_vscode" {
  source         = "./modules/repo"
  name           = "vscode"
  description    = "🚫 A Visual Studio Code extension with rich support for Dogma applications."
  languages      = ["js"]
  template       = null
  archive_status = "archived"

  workflow = null

  copyright = {
    since = 2023
  }
}
