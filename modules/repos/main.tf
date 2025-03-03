terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility
  auto_init   = true
}

locals {
  branches = ["dev", "stage", "main"]
}

resource "github_branch" "branches" {
  for_each   = toset(local.branches)
  repository = github_repository.repo.name
  branch     = each.value
}

# resource "github_branch_protection" "branch_protection" {
#   for_each      = toset(local.branches)
#   repository_id = github_repository.repo.name
#   pattern       = each.value

#   required_pull_request_reviews {
#     required_approving_review_count = 1
#   }

#   enforce_admins = true
# }

# You can create a for_each to apply to multiple repositories

module "issue_templates" {
  source          = "../issues-templates"
  repository_name = github_repository.repo.name
  default_branch  = "dev"
  commit_author   = "DevOps Team"
  commit_email    = "devops@yourcompany.com"

  depends_on = [
    github_repository.repo
  ]
}
