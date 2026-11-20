resource "railway_project" "this" {
  count = var.railway_project ? 1 : 0

  name        = var.name
  description = var.description

  # Railway workspace "Dogmatiq".
  workspace_id = "e25b5f75-d6f2-442c-8717-cbc7644c7220"

  default_environment = {
    name = "production"
  }
}

resource "railway_project_token" "ci" {
  count = local.unarchived && var.railway_project ? 1 : 0

  name           = "GitHub Actions"
  project_id     = railway_project.this[0].id
  environment_id = railway_project.this[0].default_environment.id
}

resource "github_actions_secret" "railway_token" {
  count = local.unarchived && var.railway_project ? 1 : 0

  repository      = github_repository.this.name
  secret_name     = "RAILWAY_TOKEN"
  plaintext_value = railway_project_token.ci[0].token
}

resource "railway_shared_variable" "github_token" {
  count = local.unarchived && var.railway_project && var.private ? 1 : 0

  project_id     = railway_project.this[0].id
  environment_id = railway_project.this[0].default_environment.id
  name           = "GITHUB_TOKEN"
  value          = var.railway_github_pat

  lifecycle {
    precondition {
      condition     = var.railway_github_pat != null ? trimspace(var.railway_github_pat) != "" : false
      error_message = "Private Railway projects require railway_github_pat."
    }
  }
}
