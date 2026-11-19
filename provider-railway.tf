variable "railway_api_token" {
  description = "The Railway account or workspace API token used to manage projects"
  type        = string
  sensitive   = true
  nullable    = false
}

provider "railway" {
  token = var.railway_api_token
}
