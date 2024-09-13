variable "redis_node_type" {
  description = "Node type for redis cluster nodes"
  type        = string
  default     = "cache.t3.micro"
}

variable "service_name" {
  description = "Name of the service.  Used for naming resources."
  type        = string
}

variable "service_short_name" {
  description = "Short name of the service.  Used for naming resources with lower character allowances."
  type        = string
}

variable "vpc_id" {
  description = "Id of VPC that redis cluster should be deployed in."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet ids that redis cluster should be deployed in."
  type        = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
