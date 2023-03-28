resource "aws_s3_bucket" "bucket" {
  count = var.enable ? 1 : 0
  bucket = var.bucketname

  lifecycle_rule {
    id      = "delete-after-days"

    expiration {
      days  = var.delete-days
    }

    enabled = var.delete-enable
  }
  lifecycle_rule {
    id      = "glacier-after-days"

    transition {
      days          = var.glacier-days
      storage_class = "GLACIER"
    }

    enabled = var.glacier-enable
  }
  lifecycle_rule {
    id      = "ia-after-days"

    transition {
      days          = var.ia-days
      storage_class = "STANDARD_IA"
    }

    enabled = var.ia-enable
  }

  tags = var.tags
  cors_rule = var.cors_rule

  grant {
    type        = "Group"
    permissions = ["READ_ACP"]
    uri         = "http://acs.amazonaws.com/groups/global/AllUsers"
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

