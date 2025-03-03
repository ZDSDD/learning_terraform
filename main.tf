provider "github" {
  token = var.github_token
  owner = var.owner
}

module "ratata" {
  source                 = "./modules/repos"
  repository_description = "This is a test repository"
  repository_name        = "test-repo"
  repository_visibility  = "public"
}
