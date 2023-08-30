# Name: locals.tf
# Owner: Saurav Mitra
# Description: This terraform config declares local blocks
# https://developer.hashicorp.com/terraform/language/values/locals

locals {
  vpc_cidr_block  = var.environment == "dev" ? var.vpc_cidr_block_dev : var.environment == "stg" ? var.vpc_cidr_block_stg : var.vpc_cidr_block_pro
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets  = var.environment == "dev" ? var.public_subnets_dev : var.environment == "stg" ? var.public_subnets_stg : var.public_subnets_pro
  private_subnets = var.environment == "dev" ? var.private_subnets_dev : var.environment == "stg" ? var.private_subnets_stg : var.private_subnets_pro
}
