resource "aws_security_group" "ssm_endpoints" {
  name_prefix = "${var.name}-ssm-endpoints-"
  description = "HTTPS access to ElasticRift Systems Manager endpoints"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from the private application subnet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.private_subnet_cidr]
  }

  tags = {
    Name      = "${var.name}-ssm-endpoints-sg"
    Project   = "ElasticRift"
    ManagedBy = "Terraform"
  }
}

locals {
  ssm_endpoint_services = toset([
    "ssm",
    "ssmmessages",
  ])
}

resource "aws_vpc_endpoint" "ssm" {
  for_each = local.ssm_endpoint_services

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.key}"
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnet_ids
  security_group_ids  = [aws_security_group.ssm_endpoints.id]
  private_dns_enabled = true

  tags = {
    Name      = "${var.name}-${each.key}-endpoint"
    Project   = "ElasticRift"
    ManagedBy = "Terraform"
  }
}
