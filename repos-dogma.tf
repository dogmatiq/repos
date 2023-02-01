module "repo_aperture" {
  source      = "./modules/repo"
  name        = "aperture"
  description = "🚧 An intensely minimal projection-only Dogma engine."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_browser" {
  source      = "./modules/repo"
  name        = "browser"
  description = "🚧 A web-based documentation server for inspecting Dogma applications."
  languages   = ["go"]

  copyright = {
    since = 2021
  }
}

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

module "repo_cloud" {
  source      = "./modules/repo"
  name        = "cloud"
  description = "The easiest way to run Dogma applications in the cloud."
  private     = true
  languages   = ["go"]

  copyright = {
    since = 2021
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
  description = "A specification and API for building message-based applications in Go."
  languages   = ["go"]
  template    = null

  copyright = {
    since   = 2018
    holders = ["Kevin Millar", "Danil Petrov"]
  }
}

module "repo_dogmacli" {
  source      = "./modules/repo"
  name        = "dogmacli"
  description = "🚧 Command line tools for Dogma applications."
  languages   = ["go"]

  copyright = {
    since = 2020
  }
}

module "repo_dogmavet" {
  source      = "./modules/repo"
  name        = "dogmavet"
  description = "🚧 A Go vet tool for checking Dogma application and handler implementations."
  languages   = ["go"]

  copyright = {
    since = 2020
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

module "repo_example_ui" {
  source      = "./modules/repo"
  name        = "example-ui"
  description = "🚧 A web based frontend for the example Bank application."
  private     = true
  archived    = true
  languages   = ["go", "js"]
  template    = null
  workflow    = null

  copyright = {
    since   = 2021
    holders = ["Erin Millard"]
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

module "repo_marshalkit" {
  source      = "./modules/repo"
  name        = "marshalkit"
  description = "Marshal and unmarshal Dogma messages and other types."
  languages   = ["go"]

  copyright = {
    since = 2019
  }
}

module "repo_projectionkit" {
  source      = "./modules/repo"
  name        = "projectionkit"
  description = "Build Dogma projections using popular database systems."
  languages   = ["go"]
  workflow    = "go+sql"

  copyright = {
    since = 2019
  }
}

module "repo_sqltest" {
  source      = "./modules/repo"
  name        = "sqltest"
  description = "🚧 Internal utilities for testing Dogma projects that use SQL databases."
  languages   = ["go"]
  workflow    = "go+sql"

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
  description = "🚧 An event-sourced Dogma engine with a focus on horizontal scalability."
  languages   = ["go"]
  workflow    = "go+persistence"

  copyright = {
    since = 2021
  }
}

module "repo_verity" {
  source      = "./modules/repo"
  name        = "verity"
  description = "🚧 A scalable, event-sourced Dogma engine."
  languages   = ["go"]
  workflow    = "go+sql"

  copyright = {
    since = 2019
  }
}
