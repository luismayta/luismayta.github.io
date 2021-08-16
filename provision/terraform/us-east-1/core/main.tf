module "repository_luismayta_github_io" {
  providers = {
    github = github.owner
  }

  source      = "hadenlabs/repository/github"
  version     = "0.11.0"
  name        = "luismayta.github.io"
  description = "Luismayta github io"
  visibility  = "public"

  pages = {
    branch = "gh-pages"
    path   = "/"
  }

  topics = [
    "hugo",
    "profile",
  ]

  secrets = {
    GH_TOKEN = var.secrets.github.token
  }

  settings = {
    homepage_url         = "https://luismayta.github.io"
    vulnerability_alerts = true
  }
}
