terraform {
  required_version = "~> 1.5"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    railway = {
      source  = "terraform-community-providers/railway"
      version = "~> 0.6.3"
    }
  }
}
