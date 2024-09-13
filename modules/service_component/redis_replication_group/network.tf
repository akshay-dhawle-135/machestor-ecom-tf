data "aws_vpc" "redis_cluster_vpc" {
  id = var.vpc_id
}

resource "aws_security_group" "redis_cluster_security_group" {
  name        = "${var.service_name}-redis-cluster-sg"
  vpc_id      = data.aws_vpc.redis_cluster_vpc.id
  description = "Control network permissions for ${var.service_name} Redis cluster."

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "jump_server_ssm_security_group_ingress_rule" {
  security_group_id = aws_security_group.redis_cluster_security_group.id

  cidr_ipv4   = data.aws_vpc.redis_cluster_vpc.cidr_block
  from_port   = aws_elasticache_replication_group.elasticache_replication_group.port
  to_port     = aws_elasticache_replication_group.elasticache_replication_group.port
  ip_protocol = "tcp"

  tags = var.tags
}

resource "aws_vpc_security_group_egress_rule" "jump_server_ssm_security_group_egress_rule" {
  security_group_id = aws_security_group.redis_cluster_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = var.tags
}
