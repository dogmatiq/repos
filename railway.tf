variable "railway_deployment_tokens" {
  description = "Railway project tokens for each repository's production environment, keyed by repository name"
  type        = map(string)
  sensitive   = true
  default     = {}
  nullable    = false
}
