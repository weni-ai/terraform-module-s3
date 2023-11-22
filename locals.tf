locals {
  current_timestamp = timestamp()
  common_tags = merge(
    tomap({
      name        = var.bucketname
      environment = var.environment
      team        = var.team
      service     = "S3"
      managed_by  = "Terraform"
      created     = formatdate("YYYY-MM-DD", local.current_timestamp)
    }),
    var.tags
  )
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

