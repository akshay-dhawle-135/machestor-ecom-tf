module "users_service" {
  source = "./modules/service/ecom_users_service"
  global_prefix                           = local.global_prefix
  global_short_prefix                     = local.global_short_prefix
  relative_prefix                         = local.relative_prefix
  relative_short_prefix                   = local.relative_short_prefix
  aws_region                              = var.aws_settings.aws_region
  aws_account_id                          = var.aws_settings.account_id
  github_organization_name                = var.xplor_github_organization_name
  github_repository_name                  = "ecom-user-service"
  github_deployment_branch_name           = "main"
  github_deployment_reviewer_teams        = var.cdp_github_repository_deployment_reviewer_teams
  federated_oidc_provider_arn             = module.common.github_openid_connect_provider_arn
  supplemental_deployment_policy_arns     = []
  tags = merge(
    local.base_tags,
    {
      category     = "ecom",
      service      = "ecom-user-service-api"
      service-name = "ecom-user-service-api"
    }
  )
}
