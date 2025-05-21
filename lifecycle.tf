resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id

  rule {
    id = "Transition to Standard-IA"

    transition {
      storage_class = "STANDARD_IA"
      days          = var.infrequent_access_days
    }

    status = var.infrequent_access_enabled ? "Enabled" : "Disabled"
  }

  rule {
    id = "Transition to Glacier Instant Retrieval"

    transition {
      storage_class = "GLACIER_IR"
      days          = var.glacier_days
    }

    status = var.glacier_enabled ? "Enabled" : "Disabled"
  }

  rule {
    id = "Transition to Intelligent Tiering"

    transition {
      storage_class = "INTELLIGENT_TIERING"
      days          = var.intelligent_tiering_days
    }

    status = var.intelligent_tiering_enabled ? "Enabled" : "Disabled"
  }

  rule {
    id = "Expires"

    expiration {
      days = var.expiration_objects_days
    }

    status = var.expiration_objects_enabled ? "Enabled" : "Disabled"
  }

  dynamic "rule" {
    for_each = var.extra_lifecycle

    content {
      id          = rule.key

      status      = try(
        rule.enabled,
        true
      )==true ? "Enabled" : "Disabled"

      filter      = try(
        rule.filter,
        null
      )

      transition  = try(
        rule.noncurrent_version_transition,
        null
      )
      noncurrent_version_transition = try(
        rule.transition,
        null
      )

      expiration  = try(
        rule.expiration,
        null
      )
      noncurrent_version_expiration = try(
        rule.noncurrent_version_expiration,
        null
      )
    }
  }
}
