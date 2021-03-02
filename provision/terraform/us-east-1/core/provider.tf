provider "aws" {
  region = var.aws_region
  alias  = "main"
}

provider "aws" {
  region = var.aws_region
  alias  = "cloudfront"
}

provider "github" {
  owner = var.github.owner
  token = var.github.token
  alias = "owner"
}

provider "template" {}

provider "null" {}

provider "tls" {}

provider "local" {}
