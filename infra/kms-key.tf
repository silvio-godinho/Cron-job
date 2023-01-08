resource "aws_kms_key" "terraform-kms" {
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  policy                   = data.aws_iam_policy_document.iam-policy.json
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/chave-criptografa"
  target_key_id = aws_kms_key.terraform-kms.key_id
}

output "how_to_terraform_kms_id" {
  value = aws_kms_key.terraform-kms.key_id
}