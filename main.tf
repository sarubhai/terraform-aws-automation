# Name: main.tf
# Owner: Saurav Mitra
# Description: This terraform config will create a AWS VPC using a module


module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.1.1"
  name            = var.prefix
  cidr            = local.vpc_cidr_block
  azs             = local.azs
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets
  tags = {
    Name  = "${var.prefix}-vpc"
    Owner = var.owner
    Env   = var.environment
  }
}
