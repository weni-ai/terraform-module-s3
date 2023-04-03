output "bucket" {
  description ="Bucket created"
  # sensitive = false
  value = {
    access_key = try(aws_iam_access_key.bucket-access-key[0].id, null),
    secret_key = try(nonsensitive(aws_iam_access_key.bucket-access-key[0].secret), null),
    eks_roles = try(module.eks-role[*].role_name, null),
    name = try(var.bucketname, null)
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

