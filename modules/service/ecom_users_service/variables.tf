variable "global_prefix" {
  type = string
}

variable "global_short_prefix" {
  type = string
}

variable "relative_prefix" {
  type = string
}

variable "relative_short_prefix" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "github_organization_name" {
  type = string
}

variable "github_repository_name" {
  type = string
}

variable "github_deployment_branch_name" {
  type = string
}

variable "github_deployment_reviewer_teams" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "federated_oidc_provider_arn" {
  type = string
}

variable "supplemental_deployment_policy_arns" {
  type = list(string)
}

