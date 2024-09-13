module "ecom_users_service_severless_github_deployment_setup" {
  source                           = "../../service_component/serverless_github_deployment_setup"
  aws_region                       = var.aws_region
  aws_account_id                   = var.aws_account_id
  federated_oidc_provider_arn      = var.federated_oidc_provider_arn
  resource_name_prefix             = local.relative_short_prefix
  github_environment_name_prefix   = var.global_prefix
  github_organization_name         = var.github_organization_name
  github_repository_name           = var.github_repository_name
  github_deployment_branch_name    = var.github_deployment_branch_name
  github_deployment_reviewer_teams = var.github_deployment_reviewer_teams
  supplemental_ssm_parameters = [
    {
      name        = "API_KEY"
      description = "DD API Key"
      type        = "SecureString"
      value       = "1234"
    },
  ]
  supplemental_github_environment_variables = []
  supplemental_deployment_role_managed_policy_arns = var.supplemental_deployment_policy_arns
  tags = merge(
    var.tags,
    {
      service-name = local.service_name
    }
  )
}
