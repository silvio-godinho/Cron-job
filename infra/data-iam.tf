resource "aws_iam_access_key" "my-access-key" {
  user    = aws_iam_user.my-username.name
  pgp_key = "keybase:some_person_that_exists"
}

resource "aws_iam_user" "my-username" {
  name = "terraform-101"
  path = "/system/"
}

data "aws_iam_policy_document" "iam-policy" {
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::113195610548:user/terraform-apply"
      ]
    }
    actions = [
      "kms:*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::113195610548:user/terraform-apply"
      ]
    }
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    sid = "Allow attachment of persistent resources"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::113195610548:user/terraform-apply"
      ]
    }
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = [
      "*"
    ]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values = [
        "true"
      ]
    }
  }
}