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
  description = "The primary language used within the repository"
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
