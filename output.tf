output "bucket" {
  description ="Bucket created"
  # sensitive = false
  value = {
    access_key = var.enable && var.username!="" ? aws_iam_access_key.bucket-access-key[0].id : "",
    secret_key = var.enable && var.username!="" ? nonsensitive(aws_iam_access_key.bucket-access-key[0].secret) : "",
    eks_roles = module.eks-role[*].role_name,
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

