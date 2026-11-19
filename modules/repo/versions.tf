terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    railway = {
      source  = "dogmatiq/railway"
      version = "= 0.6.3-dogmatiq.2"
    }
  }
}
