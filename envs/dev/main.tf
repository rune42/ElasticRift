module "network" {
  source = "../../modules/network"

  name              = "elasticrift"
  vpc_cidr          = "10.40.0.0/16"
  availability_zone = "eu-central-1a"
}
