# Name: tf-snowflake-state-management.tf
# Owner: Saurav Mitra
# Description: This terraform config will create S3 Bucket & DynamoDB Tavle for Terraform State Management for Snowflake Resources

resource "aws_s3_bucket" "tf_snowflake_state" {
  bucket = "tf-snowflake-state-${var.environment}"

  tags = {
    name        = "tf-snowflake-state-${var.environment}"
    environment = var.environment
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_ownership_controls" "tf_snowflake_state" {
  bucket = aws_s3_bucket.tf_snowflake_state.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }

  depends_on = [aws_s3_bucket.tf_snowflake_state]
}

resource "aws_s3_bucket_acl" "tf_snowflake_state" {
  bucket = aws_s3_bucket.tf_snowflake_state.id
  acl    = "private"

  depends_on = [aws_s3_bucket.tf_snowflake_state, aws_s3_bucket_ownership_controls.tf_snowflake_state]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_snowflake_state" {
  bucket = aws_s3_bucket.tf_snowflake_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  depends_on = [aws_s3_bucket.tf_snowflake_state]
}

resource "aws_s3_bucket_versioning" "tf_snowflake_state" {
  bucket = aws_s3_bucket.tf_snowflake_state.id

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.tf_snowflake_state]
}

resource "aws_s3_bucket_policy" "s3_deletion_protection_enabled" {
  bucket = aws_s3_bucket.tf_snowflake_state.id
  policy = data.aws_iam_policy_document.s3_deletion_protection_enabled.json
}

data "aws_iam_policy_document" "s3_deletion_protection_enabled" {
  statement {
    effect    = "Deny"
    actions   = ["s3:DeleteBucket"]
    resources = [aws_s3_bucket.tf_snowflake_state.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}



resource "aws_dynamodb_table" "tf_snowflake_state_lock" {
  name         = "tf-snowflake-state-lock-${var.environment}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  deletion_protection_enabled = true

  tags = {
    name        = "tf-snowflake-state-lock-${var.environment}"
    environment = var.environment
  }
}
