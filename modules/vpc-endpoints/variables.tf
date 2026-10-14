variable "name" {
  description = "Name prefix for ElasticRift VPC endpoints"
  type        = string
  default     = "elasticrift"
}

variable "aws_region" {
  description = "AWS region where the endpoints will be created"
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}(-gov)?-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "aws_region must be a valid AWS region identifier."
  }
}

variable "vpc_id" {
  description = "ID of the VPC hosting the interface endpoints"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs in which endpoint network interfaces will be created"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_ids) > 0
    error_message = "At least one private subnet ID must be provided."
  }
}

variable "private_subnet_cidr" {
  description = "IPv4 CIDR allowed to connect to the endpoints over HTTPS"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.private_subnet_cidr))
    error_message = "private_subnet_cidr must be a valid IPv4 CIDR."
  }
}
