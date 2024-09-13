output "redis_cluster_host" {
  value = aws_elasticache_replication_group.elasticache_replication_group.configuration_endpoint_address
}

output "redis_cluster_port" {
  value = aws_elasticache_replication_group.elasticache_replication_group.port
}

output "redis_cluster_password" {
  value = random_password.elasticache_replication_group_password.result
}
