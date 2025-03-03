terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_team" "team" {
  name        = var.team_name
  description = var.team_description
  privacy     = var.team_privacy
}

resource "github_team_membership" "members" {
  for_each = toset(var.team_members)

  team_id  = github_team.team.id
  username = each.value
  role     = var.default_role
}
