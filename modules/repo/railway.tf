resource "railway_project" "this" {
  count = var.railway_project == null ? 0 : 1

  name         = var.name
  workspace_id = var.railway_project.workspace_id

  default_environment = {
    name = "production"
  }

  lifecycle {
    prevent_destroy = true
  }
}

locals {
  # Only token presence is public; the token value remains sensitive.
  has_railway_token = var.railway_project == null ? false : nonsensitive(var.railway_project.token != null)
}

resource "github_actions_secret" "railway_token" {
  count = local.unarchived && local.has_railway_token ? 1 : 0

  repository      = github_repository.this.name
  secret_name     = "RAILWAY_TOKEN"
  plaintext_value = var.railway_project.token
}

output "railway_token_setup_required" {
  description = "Instructions for configuring this repository's missing Railway deployment token"
  value = var.railway_project != null && !local.has_railway_token ? {
    repository  = var.name
    instruction = "Create a project token for the production environment, add it as railway_deployment_tokens[\"${var.name}\"] in the Railway Terraform Cloud variable set, and apply again."
    url         = "https://railway.com/project/${railway_project.this[0].id}/settings/tokens"
  } : null
}
