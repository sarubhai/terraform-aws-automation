# terraform-aws-automation
Terraform Automation to Provision AWS Resources

The infrastructure that is used by Terraform (S3 backend for State File, DynamoDB for State Locking) should exist outside of the infrastructure that Terraform manages.

## Considerations
- Three AWS Environment Account Setup for dev, stg, pro
- No Terraform Workspace Required
- Github Branches - dev, stg, main corresponds to respective AWS Accounts
- ** Ensure Latest Version of Terraform & AWS Provider Plugin & Modules **
- Ensure Encyption & Deletion Protection is on for the S3 Buckets & DynamoDB tables (State Management)
- Enable Bucket Versioning to allow for state recovery in the case of accidental deletions and human error
- Deployment to dev from Local Machines using IAM credentials of individual developers
- Github Actions to provision resources in stg & pro
- OIDC Provider for Github is configured in AWS Account **
- IAM Role to be assumed by the web identity provider is set with Proper Permissions to S3, DynamoDB & VPC

[** OIDC Github Provider Setup](https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/)

### Github Repository Secrets:
- AWS_ACCOUNT_ID_STG
- TFSTATE_BUCKET_STG
- AWS_DYNAMODB_TABLE_STG
- AWS_ACCOUNT_ID_PRO
- TFSTATE_BUCKET_PRO
- AWS_DYNAMODB_TABLE_PRO
