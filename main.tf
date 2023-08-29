# Name: main.tf
# Owner: Saurav Mitra
# Description: This terraform config will create a AWS VPC using a module:


module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.1.1"
  name            = var.prefix
  cidr            = var.vpc_cidr_block
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags = {
    Name  = "${var.prefix}-vpc"
    Owner = var.owner
    Env   = var.environment
  }
}
