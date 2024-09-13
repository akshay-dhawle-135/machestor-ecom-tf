locals {
  environment                                           = "${var.github_environment_name_prefix}-env"
  environment_variable_aws_region_name                  = "AWS_REGION"
  environment_variable_aws_oidc_iam_role_arn_name       = "AWS_IAM_ROLE_ARN"
  environment_variable_ssm_parameter_secret_prefix_name = "SSM_SECRET_PREFIX"
  environment_variable_service_name_prefix_name         = "SERVICE_NAME_PREFIX"
}
