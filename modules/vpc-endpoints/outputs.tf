output "endpoint_ids" {
  description = "IDs of the Systems Manager interface endpoints"
  value = {
    for service, endpoint in aws_vpc_endpoint.ssm :
    service => endpoint.id
  }
}

output "security_group_id" {
  description = "Security group ID attached to the interface endpoints"
  value       = aws_security_group.ssm_endpoints.id
}
