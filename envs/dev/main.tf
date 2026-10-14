module "network" {
  source = "../../modules/network"

  name              = "elasticrift"
  vpc_cidr          = "10.40.0.0/16"
  availability_zone = "eu-central-1a"
}

module "vpc_endpoints" {
  source = "../../modules/vpc-endpoints"

  name               = "elasticrift"
  aws_region         = "eu-central-1"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = [module.network.private_subnet_id]
  private_subnet_cidr = module.network.private_subnet_cidr
}
