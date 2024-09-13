
resource "github_actions_environment_variable" "github_actions_environment_variable_aws_region" {
  repository    = data.github_repository.repository.name
  environment   = github_repository_environment.environment.environment
  variable_name = local.environment_variable_aws_region_name
  value         = var.aws_region
}

resource "github_actions_environment_variable" "github_actions_environment_variable_aws_oidc_iam_role_arn" {
  repository    = data.github_repository.repository.name
  environment   = github_repository_environment.environment.environment
  variable_name = local.environment_variable_aws_oidc_iam_role_arn_name
  value         = module.sls_github_iam.oidc_iam_role_arn
}

resource "github_actions_environment_variable" "github_actions_environment_variable_service_name_prefix" {
  repository    = data.github_repository.repository.name
  environment   = github_repository_environment.environment.environment
  variable_name = local.environment_variable_service_name_prefix_name
  value         = var.resource_name_prefix
}

resource "github_actions_environment_variable" "github_actions_environment_variable_supplemental" {
  for_each      = { for variable in var.supplemental_github_environment_variables : variable.name => variable }
  repository    = data.github_repository.repository.name
  environment   = github_repository_environment.environment.environment
  variable_name = each.key
  value         = each.value.value
}

resource "github_actions_environment_secret" "github_actions_environment_variable_supplemental" {
  for_each        = { for secret in var.supplemental_github_environment_secrets : secret.name => secret }
  repository      = data.github_repository.repository.name
  environment     = github_repository_environment.environment.environment
  secret_name     = each.key
  plaintext_value = each.value.value
}

data "github_repository" "repository" {
  name = var.github_repository_name
}

resource "github_repository_environment" "environment" {
  repository  = data.github_repository.repository.name
  environment = local.environment
  reviewers {
    teams = [for team in data.github_team.reviewer_teams : team.id]
  }
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

data "github_team" "reviewer_teams" {
  for_each = toset(var.github_deployment_reviewer_teams)
  slug     = each.key
}


