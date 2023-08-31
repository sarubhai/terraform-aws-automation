# Name: oidc-github.tf
# Owner: Saurav Mitra
# Description: This terraform config will create IAM OIDC Provider for Github & Corresponsing Role to assume

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["1c58a3a8518e8759bf075b76b750d4f2df264fcd"]

  tags = {
    name        = "github-oidc"
    environment = var.environment
  }
}


data "aws_iam_policy_document" "github_actions_trust_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:sarubhai/terraform-aws-automation:*"]
    }
  }
}

resource "aws_iam_role" "github_actions_role" {
  name               = "github-actions-role"
  assume_role_policy = data.aws_iam_policy_document.github_actions_trust_policy.json

  tags = {
    name        = "github-actions-role"
    environment = var.environment
  }
}

data "aws_iam_policy_document" "s3_dynamodb_access" {
  statement {
    effect  = "Allow"
    actions = ["s3:*"]

    resources = [
      aws_s3_bucket.tf_snowflake_state.arn,
      "${aws_s3_bucket.tf_snowflake_state.arn}/*"
    ]
  }

  statement {
    effect    = "Allow"
    actions   = ["dynamodb:*"]
    resources = [aws_dynamodb_table.tf_snowflake_state_lock.arn]
  }
}

resource "aws_iam_policy" "s3_dynamodb_access" {
  name        = "s3-dynamodb-access-policy"
  description = "s3-dynamodb-access-policy"
  policy      = data.aws_iam_policy_document.s3_dynamodb_access.json

  tags = {
    name        = "s3-dynamodb-access-policy"
    environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "github_actions_role_policy_attachment" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = aws_iam_policy.s3_dynamodb_access.arn
}
