variable "name" {
  description = "The repository name"
  type        = string
}

variable "description" {
  description = "The repository description"
  type        = string
}

variable "private" {
  description = "Indicates whether the repository is hidden from the public"
  type        = bool
  default     = false
}

variable "language" {
  description = "The primary language used within the repository"
  type        = string
}

variable "omit_template" {
  description = "Whether or not to omit the template repository configuration"
  type        = bool
  default     = false
}

variable "copyright" {
  description = "Information about the copyright notice to include in the LICENSE file"
  type = object({
    since   = string,
    holders = optional(list(string))
  })
  default = { since : "2021" }
}
