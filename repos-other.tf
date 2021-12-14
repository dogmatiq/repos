module "repo_template" {
  source      = "./modules/repo"
  name        = "template"
  description = "Repository template for Go modules."
  public      = true
  is_template = true
}

module "repo_dotgithub" {
  source               = "./modules/repo"
  name                 = ".github"
  description          = "Dogmatiq community health files."
  public               = true
  copyright_start_year = 2019
  template             = null
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
