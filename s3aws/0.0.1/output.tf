output "bucket" {
  description ="Bucket created"
  value = {
    access_key = var.enable && var.username!="" ? aws_iam_access_key.bucket-access-key[0].id : "",
    secret_key = var.enable && var.username!="" ? aws_iam_access_key.bucket-access-key[0].secret : "",
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

