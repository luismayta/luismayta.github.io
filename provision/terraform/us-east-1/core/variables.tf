variable "namespace" {
  type        = string
  description = "The namespace for project"
}

variable "project" {
  type        = string
  description = "The name for project"
}

variable "repository_domain" {
  type        = string
  description = "The domain of repository"
}

variable "repository_owner" {
  type        = string
  description = "The owner of repository"
}

variable "repository_name" {
  type        = string
  description = "The name of repository"
}

variable "keybase_path" {
  type        = string
  description = "The path of keybase"
}

variable "keybase_team_path" {
  type        = string
  description = "The path team of keybase"
}

variable "keybase_project_path" {
  type        = string
  description = "The path project of keybase"
}

variable "aws_region" {
  type        = string
  description = "The aws region"
}

variable "aws_vault" {
  type        = string
  description = "The name of vault"
}

variable "key_name" {
  type        = string
  description = "The name key for aws_key"
}

variable "stage" {
  type        = string
  description = "the var for stage (Dev, Staging, Production)"
  default     = "core"
}

variable "github" {
  type = object({
    token = string
    owner = string
  })
  description = "vars for github"
}
