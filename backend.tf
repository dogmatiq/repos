terraform {
  required_version = ">= 1"

  backend "remote" {
    organization = "dogmatiq"

    workspaces {
      name = "repos"
    }
  }
}
