provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Project     = "ElasticRift"
      Environment = "dev"
      ManagedBy   = "Terraform"
    }
  }
}
