module "repo_configkit" {
  source      = "./modules/repo"
  name        = "configkit"
  description = "Inspect, validate and visualize Dogma application configurations."
  languages   = ["go"]

  copyright = {
    since   = 2019
    holders = ["Danil Petrov"]
  }
}

module "repo_discoverkit" {
  source      = "./modules/repo"
  name        = "discoverkit"
  description = "Discover running Dogma applications on the network."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_dogma" {
  source      = "./modules/repo"
  name        = "dogma"
  description = "Build robust message-driven applications in Go."
  languages   = ["go"]
  template    = null

  copyright = {
    since   = 2018
    holders = ["Kevin Millar", "Danil Petrov"]
  }
}

module "repo_enginekit" {
  source      = "./modules/repo"
  name        = "enginekit"
  description = "🚧 Tools for developing Dogma engines."
  languages   = ["go"]

  copyright = {
    since = 2023
  }
}

module "repo_example" {
  source      = "./modules/repo"
  name        = "example"
  description = "An example Dogma application with the features of a simple bank."
  languages   = ["go"]
  template    = null

  copyright = {
    since   = 2019
    holders = ["Kevin Millar"]
  }
}

module "repo_interopspec" {
  source      = "./modules/repo"
  name        = "interopspec"
  description = "🚧 Protocol Buffers and gRPC definitions for improving engine interoperability."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_persistencekit" {
  source      = "./modules/repo"
  name        = "persistencekit"
  description = "Abstract persistence primitives for use by Dogma engines, projections, etc."
  languages   = ["go"]

  copyright = {
    since = 2023
  }
}

module "repo_projectionkit" {
  source      = "./modules/repo"
  name        = "projectionkit"
  description = "Build Dogma projections using popular database systems."
  languages   = ["go"]

  workflow = {
    services = [
      "minio",
      "dynamodb",
      "postgres",
      "mysql",
      "mariadb",
    ]
  }

  copyright = {
    since = 2019
  }
}

module "repo_sqltest" {
  source      = "./modules/repo"
  name        = "sqltest"
  description = "🚧 Internal utilities for testing Dogma projects that use SQL databases."
  languages   = ["go"]

  workflow = {
    services = [
      "postgres",
      "mysql",
      "mariadb",
    ]
  }

  copyright = {
    since = 2020
  }
}

module "repo_testkit" {
  source      = "./modules/repo"
  name        = "testkit"
  description = "Write blackbox tests for Dogma applications."
  languages   = ["go"]
  template    = null

  copyright = {
    since = 2019
  }
}

module "repo_veracity" {
  source      = "./modules/repo"
  name        = "veracity"
  description = "🚧 A horizontally-scalable event-sourced Dogma engine."
  languages   = ["go"]

  copyright = {
    since = 2021
  }
}

module "repo_verity" {
  source      = "./modules/repo"
  name        = "verity"
  description = "🚧 An event-sourced Dogma engine."
  languages   = ["go"]

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
