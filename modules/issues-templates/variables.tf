variable "repository_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "default_branch" {
  description = "Default branch of the repository"
  type        = string
  default     = "main"
}

variable "commit_author" {
  description = "Name of the commit author"
  type        = string
  default     = "Terraform"
}

variable "commit_email" {
  description = "Email of the commit author"
  type        = string
  default     = "terraform@example.com"
}


