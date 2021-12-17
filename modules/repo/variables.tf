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

variable "template" {
  description = "The template repository used to create this repository"
  type        = string
}

variable "copyright_start_year" {
  description = "The start year for the copyright notice in the LICENSE file"
  type        = string
  default     = "2021"
}

variable "copyright_end_year" {
  description = "The end year for the copyright notice in the LICENSE file"
  type        = string
  default     = "2021"
}

variable "copyright_holders" {
  description = "The names of additional people to list in the copyright notice in the LICENSE file"
  type        = list(string)
  default     = []
}
