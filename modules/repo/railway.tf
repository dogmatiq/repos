resource "railway_project" "this" {
  count = var.railway_project == null ? 0 : 1

  name = var.name

  # Railway workspace "Dogmatiq".
  workspace_id = "e25b5f75-d6f2-442c-8717-cbc7644c7220"

  default_environment = {
    name = "production"
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

check "railway_deployment_token" {
  assert {
    condition     = var.railway_project == null ? true : local.has_railway_token
    error_message = <<-EOT
      Repository "${var.name}" needs a Railway project token for its production environment.
      ${join("\n", [for project in railway_project.this : "Create it at https://railway.com/project/${project.id}/settings/tokens."])}
      Add it as railway_deployment_tokens["${var.name}"] in the Railway Terraform Cloud variable set, then apply again.
    EOT
  }
}
