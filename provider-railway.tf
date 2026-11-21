variable "railway_api_token" {
  description = "The Railway account or workspace API token used to manage projects"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "railway_github_pat" {
  description = "Read-only GitHub Packages PAT supplied as an Actions secret to private Railway-enabled repositories"
  type        = string
  sensitive   = true
  nullable    = false
}

provider "railway" {
  token = var.railway_api_token
}
