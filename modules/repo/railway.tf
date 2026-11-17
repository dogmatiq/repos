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
