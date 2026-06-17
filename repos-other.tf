module "repo_proclaim" {
  source      = "./modules/repo"
  name        = "proclaim"
  description = "🚧 A Kubernetes controller and CRD that publishes DNS-SD records."
  languages   = ["go"]

  copyright = {
    since = 2022
  }
}

module "repo_postgres_crd_controller" {
  source      = "./modules/repo"
  name        = "postgres-crd-controller"
  description = "🚧 A Kubernetes controller and CRD that manages PostgreSQL databases."
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

resource "github_repository" "website" {
  archive_on_destroy = true

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
