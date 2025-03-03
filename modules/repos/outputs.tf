output "repository_url" {
  description = "The URL of the created GitHub repository"
  value       = github_repository.repo.html_url
}

output "branch_names" {
  description = "List of branches created in the repository"
  value       = [for branch in github_branch.branches : branch.branch]
}
