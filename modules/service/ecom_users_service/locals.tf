# global locals
locals {
  service_name = "ecom-user-service-api"
}

locals {
  relative_prefix       = "${var.relative_prefix}-${local.service_name}"
  relative_short_prefix = "${var.relative_short_prefix}-${local.service_name}"
}

# github locals
locals {
  environment                                           = "${var.global_prefix}-env"
  environment_variable_aws_region_name                  = "AWS_REGION"
  environment_variable_service_name_prefix_name         = "SERVICE_NAME_PREFIX"
}

 
