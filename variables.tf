
variable "xplor_github_organization_name" {
  type    = string
  default = "akshay-dhawle-135"
}

variable "cdp_github_repository_deployment_reviewer_teams" {
  description = "Reviewers for CDP Services"
  type        = list(string)
  default     = []
}

variable "aws_settings" {
  description = "AWS settings used for Cloud Platform"
  type = object({
    aws_region = string
    account_id = string
  })
  default = {
    aws_region = "ap-south-1"
    account_id = "501921308880"
  }
}

variable "workspace_settings" {
  description = "TF workspace settings variables"
  default = {
    "environment" : "dev",
    "global_settings" : {
      "environment" : "dev",
      "home_region" : true,
      "region_code" : "ap-south-1",
      "region_name" : "usea1"
    },
    "workspace_cloud": "aws",
    "workspace_env": "dev",
    "workspace_name": "ecom-shared-technology",
    "workspace_prefix": "aws",
  }
}
