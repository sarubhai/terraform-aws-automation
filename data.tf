# Name: data.tf
# Owner: Saurav Mitra
# Description: This terraform config declares data blocks
# https://developer.hashicorp.com/terraform/language/data-sources

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}
