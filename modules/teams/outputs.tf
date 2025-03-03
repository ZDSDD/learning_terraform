output "team_id" {
  description = "The ID of the created GitHub team"
  value       = github_team.team.id
}

output "team_name" {
  description = "The name of the created GitHub team"
  value       = github_team.team.name
}

output "team_members" {
  description = "List of GitHub users in the team"
  value       = var.team_members
}
