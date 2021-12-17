module "repo_aperture" {
  source      = "./modules/repo"
  name        = "aperture"
  description = "🚧 An intensely minimal projection-only Dogma engine."
  language    = "go"

  copyright = {
    since = 2019
  }
}

module "repo_browser" {
  source      = "./modules/repo"
  name        = "browser"
  description = "🚧 A web-based documentation server for inspecting Dogma applications."
  language    = "go"

  copyright = {
    since = 2021
  }
}

module "repo_configkit" {
  source      = "./modules/repo"
  name        = "configkit"
  description = "Inspect, validate and visualize Dogma application configurations."
  language    = "go"

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
  language    = "go"

  copyright = {
    since = 2021
  }
}

module "repo_discoverkit" {
  source      = "./modules/repo"
  name        = "discoverkit"
  description = "Discover running Dogma applications on the network."
  language    = "go"

  copyright = {
    since = 2019
  }
}

module "repo_dogma" {
  source        = "./modules/repo"
  name          = "dogma"
  description   = "A specification and API for building message-based applications in Go."
  language      = "go"
  omit_template = true

  _dependabot_experiment = true

  copyright = {
    since   = 2018
    holders = ["Kevin Millar", "Danil Petrov"]
  }
}

module "repo_dogmacli" {
  source      = "./modules/repo"
  name        = "dogmacli"
  description = "🚧 Command line tools for Dogma applications."
  language    = "go"

  copyright = {
    since = 2020
  }
}

module "repo_dogmavet" {
  source      = "./modules/repo"
  name        = "dogmavet"
  description = "🚧 A Go vet tool for checking Dogma application and handler implementations."
  language    = "go"

  copyright = {
    since = 2020
  }
}

module "repo_example" {
  source        = "./modules/repo"
  name          = "example"
  description   = "An example Dogma application with the features of a simple bank."
  language      = "go"
  omit_template = true

  copyright = {
    since   = 2019
    holders = ["Kevin Millar"]
  }
}

module "repo_example_ui" {
  source        = "./modules/repo"
  name          = "example-ui"
  description   = "🚧 A web based frontend for the example Bank application."
  private       = true
  language      = "js"
  omit_template = true

  _dependabot_experiment = true

  copyright = {
    since   = 2021
    holders = ["Erin Millard"]
  }
}

module "repo_interopspec" {
  source      = "./modules/repo"
  name        = "interopspec"
  description = "🚧 Protocol Buffers and gRPC definitions for improving engine interoperability."
  language    = "go"

  copyright = {
    since = 2019
  }
}

module "repo_marshalkit" {
  source      = "./modules/repo"
  name        = "marshalkit"
  description = "Marshal and unmarshal Dogma messages and other types."
  language    = "go"

  copyright = {
    since = 2019
  }
}

module "repo_projectionkit" {
  source      = "./modules/repo"
  name        = "projectionkit"
  description = "Build Dogma projections using popular database systems."
  language    = "go"

  copyright = {
    since = 2019
  }
}

module "repo_sqltest" {
  source      = "./modules/repo"
  name        = "sqltest"
  description = "🚧 Internal utilities for testing Dogma projects that use SQL databases."
  language    = "go"

  copyright = {
    since = 2020
  }
}

module "repo_testkit" {
  source        = "./modules/repo"
  name          = "testkit"
  description   = "Write blackbox tests for Dogma applications."
  language      = "go"
  omit_template = true

  copyright = {
    since = 2019
  }
}

module "repo_veracity" {
  source      = "./modules/repo"
  name        = "veracity"
  description = "🚧 An event-sourced Dogma engine that uses an append-only journal for persistence."
  private     = true
  language    = "go"

  copyright = {
    since = 2021
  }
}

module "repo_verity" {
  source      = "./modules/repo"
  name        = "verity"
  description = "🚧 A scalable, event-sourced Dogma engine."
  language    = "go"

  copyright = {
    since = 2019
  }
}
