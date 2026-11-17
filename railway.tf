variable "railway_deployment_tokens" {
  description = "Environment-scoped Railway deployment tokens, keyed by project key"
  type        = map(string)
  sensitive   = true
  default     = {}
  nullable    = false
}

resource "railway_project" "this" {
  for_each = {
    example = "Dogma Example"
    stories = "Dogma Stories"
  }

  name         = each.value
  workspace_id = "e25b5f75-d6f2-442c-8717-cbc7644c7220"

  default_environment = {
    name = "production"
  }

  lifecycle {
    prevent_destroy = true
  }
}

locals {
  railway_projects = {
    for key, project in railway_project.this : key => {
      name  = project.name
      token = lookup(var.railway_deployment_tokens, key, null)
    }
  }
}
