variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "owner" {
  description = "GitHub organization or user"
  type        = string
}
