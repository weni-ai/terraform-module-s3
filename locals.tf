locals {
  current_timestamp = timestamp()
  common_tags = merge(
    tomap({
      Name        = var.bucketname
      Environment = var.environment
      Squad       = var.squad
      Service     = "S3"
      Managed_By  = "Terraform"
      Created     = formatdate("YYYY-MM-DD", local.current_timestamp)
    }),
    var.tags
  )
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

