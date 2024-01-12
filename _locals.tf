locals {
  default_tags = {
    Managed_By      = "Terraform"
    CreateTimestamp = timestamp()
  }

  common_tags = merge(
    local.default_tags,
    var.tags
  )
}
