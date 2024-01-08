locals {
  current_timestamp = timestamp()

  default_tags = {
    Managed_By = "Terraform"
    Created    = formatdate("YYYY-MM-DD", local.current_timestamp)
  }

  common_tags = merge(
    local.default_tags,
    var.tags
  )
}
