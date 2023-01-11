terraform {
  required_version = ">=0.14"
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.25.0"
    }

    github = {
      source  = "integrations/github"
      version = ">=4.5.0"
    }

    local = {
      source  = "hashicorp/local"
      version = ">= 1.3.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">=0.1.0"
    }

    template = {
      source  = "hashicorp/template"
      version = ">=1.0.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">=2.1.1"
    }
  }
}
