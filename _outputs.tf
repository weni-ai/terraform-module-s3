output "aws_access_key" {
  description = "IAM access key for S3 bucket"
  value       = try(aws_iam_access_key.bucket_access_key[0].id, null)
}

output "aws_secret_key" {
  description = "IAM secret key for S3 bucket"
  value       = try(nonsensitive(aws_iam_access_key.bucket_access_key[0].secret), null)
}

output "eks_role" {
  description = "IAM role ARN for EKS cluster"
  value       = try(module.iam_eks_role[0].iam_role_arn, null)
}
