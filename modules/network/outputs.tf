output "vpc_id" {
  description = "ID of the ElasticRift VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "IPv4 CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "internet_gateway_id" {
  description = "ID of the VPC Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "public_subnet_id" {
  description = "ID of the initial public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private application subnet"
  value       = aws_subnet.private.id
}

output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = aws_route_table.private.id
}
