terraform {
  required_version = "~> 1.3"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }

    # Bundled in terraform.d/plugins until upstream supports project tokens.
    railway = {
      source  = "dogmatiq/railway"
      version = "= 0.6.3-dogmatiq.2"
    }
  }
}
