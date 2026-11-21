module "github" {
  source = "./modules/github"
}

provider "github" {
  owner = module.github.org

  # The private key comes from the shared HCP GitHub variable set.
  app_auth {
    id              = module.github.app.id
    installation_id = module.github.app.installation_id
  }
}
