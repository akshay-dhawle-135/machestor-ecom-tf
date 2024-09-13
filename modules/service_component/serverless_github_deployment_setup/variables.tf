variable "tags" {
  type    = map(string)
  default = {}
}

variable "aws_region" {
  description = "AWS region to be used in sls deployment."
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account Id to be used in sls deployment."
  type        = string
}

variable "resource_name_prefix" {
  description = "Prefix to append to the beginning of resources."
  type        = string
}

variable "github_environment_name_prefix" {
  description = "Prefix to append to the beginning of GitHub environment."
  type        = string
}

variable "github_repository_name" {
  description = "GitHub repository to create environment in."
  type        = string
}

variable "github_organization_name" {
  description = "GitHub organization that repository resides in."
  type        = string
}

variable "github_deployment_reviewer_teams" {
  description = "Deployment reviewer teams for GitHub repository environment."
  type        = list(string)
}

variable "github_deployment_branch_name" {
  type = string
}

variable "federated_oidc_provider_arn" {
  description = "ARN of Federated OIDC Provider."
  type        = string
}

variable "supplemental_deployment_iam_role_permissions" {
  description = "Supplemental permissions for the deployment role"
  type = list(object({
    actions   = list(string)
    resources = list(string)
  }))
  default = []
}

variable "supplemental_ssm_parameters" {
  description = "Supplemental parameters to create in System Manager Parameter Store"
  type = list(object({
    name        = string
    description = string
    type        = string
    value       = string
  }))
  default = []
}

variable "supplemental_github_environment_variables" {
  description = "Supplemental variables to create in GitHub environment"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "supplemental_github_environment_secrets" {
  description = "Supplemental secrets to create in GitHub environment"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "supplemental_deployment_role_managed_policy_arns" {
  description = "Supplemental managed policy ARNs to attach to the deployment role"
  type        = list(string)
  default     = []
}


