variable "team_name" {
  description = "The name of the GitHub team"
  type        = string
}

variable "team_description" {
  description = "A short description of the GitHub team"
  type        = string
  default     = "Managed by Terraform"
}

variable "team_privacy" {
  description = "Privacy setting of the team (closed or secret)"
  type        = string
  default     = "closed"
}

variable "team_members" {
  description = "List of GitHub usernames to add to the team"
  type        = list(string)
  default     = []
}

variable "default_role" {
  description = "Default role for team members (member or maintainer)"
  type        = string
  default     = "member"
}
