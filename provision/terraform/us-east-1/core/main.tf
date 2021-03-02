module "repository_luismayta_github_io" {
  providers = {
    github = github.owner
  }

  source      = "hadenlabs/repository/github"
  version     = "0.7.2"
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

  settings = {
    homepage_url         = "https://luismayta.github.io"
    vulnerability_alerts = true
  }
}
