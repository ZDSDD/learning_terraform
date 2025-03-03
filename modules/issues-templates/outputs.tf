output "bug_template_sha" {
  description = "SHA of the bug report template file"
  value       = github_repository_file.bug_template.sha
}

output "feature_template_sha" {
  description = "SHA of the feature request template file"
  value       = github_repository_file.feature_template.sha
}

output "task_template_sha" {
  description = "SHA of the task template file"
  value       = github_repository_file.task_template.sha
}
