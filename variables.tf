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
  description = "This environment tag will be included in the owner of the resources."
  default     = "dev"
}

# VPC CIDR
variable "vpc_cidr_block" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# Subnet CIDR
variable "private_subnets" {
  description = "A list of CIDR blocks to use for the private subnet."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "A list of CIDR blocks to use for the public subnet."
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}
