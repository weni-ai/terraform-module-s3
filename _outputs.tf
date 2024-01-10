output "s3_access_info" {
  description = "IAM role name, S3 bucket name, and user access keys with permissions"
  value = {
    access_key = try(aws_iam_access_key.bucket_access_key[0].id, null),
    secret_key = try(nonsensitive(aws_iam_access_key.bucket_access_key[0].secret), null),
    eks_roles  = try(module.iam_eks_role[*].iam_role_arn, null),
    name       = try(var.bucket_name, null)
  }
}
