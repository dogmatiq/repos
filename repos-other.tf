module "repo_template" {
  source      = "./modules/repo"
  name        = "template"
  description = "Repository template for Go modules."
  public      = true
  is_template = true
}
