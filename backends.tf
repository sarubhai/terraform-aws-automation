# Name: backends.tf
# Owner: Saurav Mitra
# Description: This terraform config will Configure Terraform Backend
# https://www.terraform.io/docs/language/settings/backends/index.html
# https://developer.hashicorp.com/terraform/language/settings/backends/configuration#partial-configuration
# DynamoDB Partition key: LockID

terraform {
  backend "s3" {
    region  = "eu-central-1"
    key     = "terraform.tfstate"
    acl     = "private"
    encrypt = true

    # Github Secrets & Actions to Initialize Backends using Environment Variables
    # terraform init -backend-config="bucket=xxx" -backend-config="dynamodb_table=yyy" 
    # bucket         = "tfstate-backend-aws-automation-dev"
    # dynamodb_table = "terraform-lock-dev"
  }
}