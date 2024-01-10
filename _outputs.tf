output "s3_access_info" {
  description = "IAM role name, S3 bucket name, and user access keys with permissions"
  value = {
    (var.bucket_name) = {
      aws_access_key = try(aws_iam_access_key.bucket_access_key[0].id, null),
      aws_secret_key = try(nonsensitive(aws_iam_access_key.bucket_access_key[0].secret), null),
      eks_role       = try(module.iam_eks_role[0].iam_role_arn, null),
    }
  }
}
