variable "railway_deployment_tokens" {
  description = "Railway project tokens for each repository's production environment, keyed by repository name"
  type        = map(string)
  sensitive   = true
  default     = {}
  nullable    = false
}

output "railway_token_setup_required" {
  description = "Repositories whose Railway projects need production deployment tokens"
  value = [
    for setup in [
      module.repo_example.railway_token_setup_required,
      module.repo_stories.railway_token_setup_required,
    ] : setup if setup != null
  ]
}
