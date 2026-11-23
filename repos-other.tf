module "repo_proclaim" {
  source      = "./modules/repo"
  name        = "proclaim"
  description = "A Kubernetes controller and CRD that publishes DNS-SD records."
  languages   = ["go"]

  copyright = {
    since = 2022
  }
}

module "repo_postgres_crd_controller" {
  source      = "./modules/repo"
  name        = "postgres-crd-controller"
  description = "A Kubernetes controller and CRD that manages PostgreSQL databases."
  languages   = ["go"]
  private     = true

  copyright = {
    since = 2026
  }
}

module "repo_dotgithub" {
  source      = "./modules/repo"
  name        = ".github"
  description = "Dogmatiq community health files."

  languages = []
  workflow  = null

  copyright = {
    since = 2019
  }
}

module "repo_agent_config" {
  source      = "./modules/repo"
  name        = "agent-config"
  description = "AI agent skills and configuration for Dogmatiq projects, packaged for APM."

  languages        = []
  workflow         = null
  publish_releases = true # there is no build process, but each tag is a release

  copyright = {
    since = 2026
  }
}

module "repo_branding" {
  source      = "./modules/repo"
  name        = "branding"
  description = "Dogmatiq logos, brand guidelines and other brand assets."
  private     = true

  languages = []
  workflow  = null

  copyright = {
    since = 2026
  }
}

module "repo_infra" {
  source      = "./modules/repo"
  name        = "infra"
  description = "Terraform configuration for Dogmatiq infrastructure."
  private     = true

  languages = []
  workflow  = null

  copyright = {
    since = 2026
  }
}

module "repo_website" {
  source      = "./modules/repo"
  name        = "website"
  description = "The source of the Dogmatiq website."
  private     = true

  languages = []

  copyright = {
    since = 2019
  }
}

resource "github_repository" "website" {
  archive_on_destroy = true
  archived           = true

  name         = "dogmatiq.github.io"
  description  = "The Dogmatiq website."
  homepage_url = "https://dogmatiq.io"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
  allow_merge_commit     = true
  allow_squash_merge     = false
  allow_rebase_merge     = false

  vulnerability_alerts = true

  pages {
    cname = "dogmatiq.io"
    source {
      branch = "main"
    }
  }
}
