resource "aws_elasticache_replication_group" "elasticache_replication_group" {
  replication_group_id       = "${substr(var.service_short_name, 0, 32)}-cluster"
  description                = "${var.service_name} Cluster"
  node_type                  = var.redis_node_type
  port                       = 6379
  engine_version             = "7.1"
  parameter_group_name       = "default.redis7.cluster.on"
  automatic_failover_enabled = true
  subnet_group_name          = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids         = [aws_security_group.redis_cluster_security_group.id]

  num_node_groups         = 1
  replicas_per_node_group = 1

  transit_encryption_enabled = true
  auth_token                 = random_password.elasticache_replication_group_password.result
  auth_token_update_strategy = "SET"
  tags                       = var.tags
}


resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "${var.service_short_name}-cache-subnet"
  subnet_ids = var.subnet_ids
  tags       = var.tags
}

resource "random_password" "elasticache_replication_group_password" {
  length           = 32
  special          = true
  override_special = "!&#$^<>-"
}
