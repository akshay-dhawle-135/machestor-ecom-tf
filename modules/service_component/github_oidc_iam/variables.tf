variable "role_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "federated_oidc_provider_arn" {
  type = string
}

variable "role_aud" {
  type    = string
  default = "sts.amazonaws.com"
}

variable "repository_list" {
  type = list(string)
  default = []
}

variable "repository_name" {
  type = string
  default = ""
}

variable "organization_name" {
  type    = string
  default = "xplor"
}

variable "managed_policy_arns" {
  type    = list(string)
  default = []
}
