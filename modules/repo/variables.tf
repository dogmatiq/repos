variable "name" {
  description = "The repository name"
  type        = string
  nullable    = false
}

variable "description" {
  description = "The repository description"
  type        = string
  nullable    = false
}

variable "private" {
  description = "Indicates whether the repository is hidden from the public"
  type        = bool
  default     = false
  nullable    = false
}

variable "archived" {
  description = "Indicates whether the repository is archived"
  type        = bool
  default     = false
  nullable    = false
}

variable "languages" {
  description = "The languages used within the repository"
  type        = list(string)
  nullable    = false
}

variable "template" {
  description = "Override the template repository, otherwise it is determined based on the specified language"
  type        = string
  default     = "(default)" # sentinel used to detect absence of attribute
  nullable    = true
}


variable "workflow" {
  description = "Override the GitHub Actions workflow, otherwise it is determined based on the specified language"
  type = object({
    name     = optional(string),
    services = optional(set(string), [])
  })
  default  = {}
  nullable = true
}

variable "copyright" {
  description = "Information about the copyright notice to include in the LICENSE file"
  type = object({
    since   = string,
    until   = optional(string),
    holders = optional(list(string), [])
  })
  nullable = false
}

locals {
  primary_language = length(var.languages) == 0 ? null : var.languages[0]
  template         = var.template == "(default)" ? local.primary_language : var.template

  has_workflow = var.workflow != null && !var.archived
  workflow = {
    name     = local.has_workflow ? coalesce(var.workflow.name, "ci") : ""
    services = local.has_workflow ? var.workflow.services : []
  }

  enable_branch_protection     = local.has_workflow && !var.private # not supported by private repos on free-tier
  enable_dependabot            = length(var.languages) != 0
  enable_dependabot_auto_merge = local.enable_dependabot && github_repository.this.allow_auto_merge
  enable_codecov               = contains(var.languages, "go")

  publish_releases = local.has_workflow # publish releases for any repo that has a build process
}
