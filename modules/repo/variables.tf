variable "name" {
  description = "The repository name"
  type        = string
}

variable "description" {
  description = "The repository description"
  type        = string
}

variable "public" {
  description = "Indicates whether the repository is visible to the public"
  type        = bool
}

variable "template" {
  description = "The template repository used to create this repository"
  type        = string
  default     = "template"
}

variable "copyright_start_year" {
  description = "The start year for the copyright notice in the LICENSE file"
  type        = string
}

variable "copyright_holders" {
  description = "The names of additional people to list in the copyright notice in the LICENSE file"
  type        = list(string)
  default     = []
}
