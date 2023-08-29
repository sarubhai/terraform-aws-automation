# terraform-aws-automation
Terraform Automation to Provision AWS Resources

The infrastructure that is used by Terraform (S3 backend for State File, DynamoDB for State Locking) should exist outside of the infrastructure that Terraform manages.

## Considerations
- Three AWS Environment Account Setup for dev, stg, pro
- No Terraform Workspace Required
- Github Branches - dev, stg, main corresponds to respective AWS Accounts
- ** Ensure Latest Version of Terraform & AWS Provider Plugin & Modules **
- Ensure Encyption & Deletion Protection is on for the S3 Buckets & DynamoDB tables (State Management)
- Deployment to dev from Local Machines using IAM credentials of individual developers
- Github Actions to provision resources in stg & pro

### Github Repository Secrets:
- AWS_ACCESS_KEY_ID_STG
- AWS_SECRET_ACCESS_KEY_STG
- TFSTATE_BUCKET_STG
- AWS_DYNAMODB_TABLE_STG
- AWS_ACCESS_KEY_ID_PRO
- AWS_SECRET_ACCESS_KEY_PRO
- TFSTATE_BUCKET_PRO
- AWS_DYNAMODB_TABLE_PRO
