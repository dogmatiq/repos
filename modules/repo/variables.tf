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

variable "languages" {
  description = "The languages used within the repository"
  type        = list(string)
  nullable    = false
}

variable "template" {
  description = "Override the template repository, otherwise it is determined based on the specified language"
  type        = string
  default     = "(default)"
  nullable    = true
}


variable "workflow" {
  description = "Override the GitHub Actions workflow, otherwise it is determined based on the specified language"
  type        = string
  default     = "(default)"
  nullable    = true
}

variable "copyright" {
  description = "Information about the copyright notice to include in the LICENSE file"
  type = object({
    since   = string,
    holders = optional(list(string))
  })
  default  = { since : "2021" }
  nullable = false
}

variable "publish_releases" {
  description = "Automatically publish GitHub releases when a tag is pushed."
  type        = bool
  default     = false
  nullable    = false
}

locals {
  primary_language = length(var.languages) == 0 ? null : var.languages[0]
  template         = var.template == "(default)" ? local.primary_language : var.template
  workflow         = var.workflow == "(default)" ? local.primary_language : var.workflow

  enable_branch_protection     = local.workflow != null && !var.private # not supported by private repos on free-tier
  enable_dependabot            = local.primary_language != null
  enable_dependabot_auto_merge = local.enable_dependabot && github_repository.this.allow_auto_merge

  publish_releases = var.publish_releases # && local.primary_language != null
}
