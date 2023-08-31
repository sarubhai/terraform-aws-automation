# variables.tf
# Owner: Saurav Mitra
# Description: Variables used by terraform config to create the infrastructure resources for VPC
# https://www.terraform.io/docs/configuration/variables.html

# Tags
variable "prefix" {
  description = "This prefix will be included in the name of the resources."
  default     = "terraform-aws-automation"
}

variable "owner" {
  description = "This owner name tag will be included in the owner of the resources."
  default     = "Saurav Mitra"
}

variable "environment" {
  description = "This environment tag will be included in the environment of the resources."
  default     = "dev"
}


# DEV
# VPC CIDR
variable "vpc_cidr_block_dev" {
  description = "The address space that is used by the virtual network."
  default     = "10.148.0.0/18"
}

# Subnet CIDR
variable "private_subnets_dev" {
  description = "A list of CIDR blocks to use for the private subnet."
  default     = ["10.148.0.0/21", "10.148.8.0/21", "10.148.16.0/21"]
}

variable "public_subnets_dev" {
  description = "A list of CIDR blocks to use for the public subnet."
  default     = ["10.148.32.0/21", "10.148.40.0/21", "10.148.48.0/21"]
}

# STG
# VPC CIDR
variable "vpc_cidr_block_stg" {
  description = "The address space that is used by the virtual network."
  default     = "10.148.64.0/18"
}

# Subnet CIDR
variable "private_subnets_stg" {
  description = "A list of CIDR blocks to use for the private subnet."
  default     = ["10.148.64.0/21", "10.148.72.0/21", "10.148.80.0/21"]
}

variable "public_subnets_stg" {
  description = "A list of CIDR blocks to use for the public subnet."
  default     = ["10.148.96.0/21", "10.148.104.0/21", "10.148.112.0/21"]
}

# PRO
# VPC CIDR
variable "vpc_cidr_block_pro" {
  description = "The address space that is used by the virtual network."
  default     = "10.148.128.0/18"
}

# Subnet CIDR
variable "private_subnets_pro" {
  description = "A list of CIDR blocks to use for the private subnet."
  default     = ["10.148.128.0/21", "10.148.136.0/21", "10.148.144.0/21"]
}

variable "public_subnets_pro" {
  description = "A list of CIDR blocks to use for the public subnet."
  default     = ["10.148.160.0/21", "10.148.168.0/21", "10.148.176.0/21"]
}
