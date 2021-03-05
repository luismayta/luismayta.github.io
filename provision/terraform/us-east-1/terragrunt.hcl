terraform {
  extra_arguments "retry_lock" {
    commands = get_terraform_commands_that_need_locking()
    arguments = [
      "-lock-timeout=40m"
    ]
  }
}

remote_state {
  backend = "s3"
  config = {
    bucket  = local.terragrunt_bucket
    encrypt = true
    # Configure Terragrunt to automatically store tfstate files in an S3 bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    dynamodb_table = local.terragrunt_dynamodb_table

    s3_bucket_tags = {
      owner = "terragrunt luismayta.github.io luismayta"
      name  = "Terraform state storage"
    }

    #   # dynamodb_table_tags is an attribute, so an equals sign is REQUIRED
    dynamodb_table_tags = {
      owner = "terragrunt luismayta.github.io luismayta"
      name  = "Terraform lock table"
    }
  }
}

inputs = {
  aws_vault  = local.team
  namespace  = local.namespace
  project    = local.project
  aws_region = local.region
  key_name   = local.key_name

  # repository
  repository_domain = local.repository_domain
  repository_owner  = local.repository_owner
  repository_name   = local.repository_name

  # keybase
  keybase_path         = local.keybase_path
  keybase_team_path    = local.keybase_team_path
  keybase_project_path = local.keybase_project_path

  # github
  github = {
    token = local.github_token
    owner = local.github_owner
  }

  # secrets vars of sops
  secrets = local.secrets

}

locals {
  secrets                   = try(yamldecode(sops_decrypt_file("secrets.enc.yaml")), {})
  aws_vault                 = get_env("AWS_VAULT", "luismayta")
  namespace                 = get_env("NAMESPACE", "luismayta")
  team                      = get_env("KEYBASE_TEAM", "luismayta")
  project                   = get_env("PROJECT", "luismayta.github.io")
  region                    = get_env("AWS_DEFAULT_REGION", "us-east-1")
  key_name                  = local.project
  github_owner              = get_env("GITHUB_OWNER", "luismayta")
  github_token              = get_env("GITHUB_TOKEN", "")
  repository_domain         = "github.com"
  repository_owner          = local.team
  repository_name           = local.project
  keybase_path              = get_env("KEYBASE_VOLUME_PATH", "default")
  keybase_team_path         = format("%s/private/%s", local.keybase_path, local.team)
  keybase_project_path      = format("%s/%s/%s/%s", local.keybase_team_path, local.repository_domain, local.repository_owner, local.project)
  terragrunt_bucket         = replace(format("%s-%s-terraform-state-%s", local.team, local.project, local.region), ".", "-")
  terragrunt_dynamodb_table = replace(format("%s-%s-%s", local.team, local.project, local.region), ".", "-")
}
