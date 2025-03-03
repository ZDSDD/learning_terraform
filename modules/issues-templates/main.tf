terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository_file" "template_directory" {
  repository          = var.repository_name
  branch              = var.default_branch
  file                = ".github/ISSUE_TEMPLATE/.gitkeep"
  content             = ""
  commit_message      = "Initialize issue template directory"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "bug_template" {
  depends_on          = [github_repository_file.template_directory]
  repository          = var.repository_name
  branch              = var.default_branch
  file                = ".github/ISSUE_TEMPLATE/bug_report.md"
  content             = <<-EOT
---
name: Bug Report
about: Create a report to help us improve
title: '[BUG] '
labels: bug
assignees: ''
---

## Describe the bug
A clear and concise description of what the bug is.

## To Reproduce
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

## Expected behavior
A clear and concise description of what you expected to happen.

## Screenshots
If applicable, add screenshots to help explain your problem.

## Environment
 - OS: [e.g. iOS]
 - Browser/Version: [e.g. chrome, safari]
 - Application Version: [e.g. 22]

## Additional context
Add any other context about the problem here.
EOT
  commit_message      = "Add bug report issue template"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "feature_template" {
  depends_on          = [github_repository_file.template_directory]
  repository          = var.repository_name
  branch              = var.default_branch
  file                = ".github/ISSUE_TEMPLATE/feature_request.md"
  content             = <<-EOT
---
name: Feature Request
about: Suggest an idea for this project
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

## Is your feature request related to a problem? Please describe.
A clear and concise description of what the problem is. Ex. I'm always frustrated when [...]

## Describe the solution you'd like
A clear and concise description of what you want to happen.

## Describe alternatives you've considered
A clear and concise description of any alternative solutions or features you've considered.

## Additional context
Add any other context or screenshots about the feature request here.
EOT
  commit_message      = "Add feature request issue template"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}

resource "github_repository_file" "task_template" {
  depends_on          = [github_repository_file.template_directory]
  repository          = var.repository_name
  branch              = var.default_branch
  file                = ".github/ISSUE_TEMPLATE/task.md"
  content             = <<-EOT
---
name: Task
about: Create a task that needs to be completed
title: '[TASK] '
labels: task
assignees: ''
---

## Task Description
A clear and concise description of what needs to be done.

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Dependencies
List any dependencies or blockers for this task.

## Additional Information
Any other information that would be helpful for completing this task.
EOT
  commit_message      = "Add task issue template"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true
}
