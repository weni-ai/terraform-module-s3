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
    for_each = try(var.extra_lifecycle, {})

    content {
      id          = rule.key

      status      = try(
        rule.enabled,
        true
      )==true ? "Enabled" : "Disabled"

      dynamic "filter" {
        for_each = try(
          rule.value.prefix, null) == null ? [] : toset(["0"]
        )

        content {
          prefix = lookup(rule.value, "prefix", null)

          and {
            tags = lookup(rule.value, "tags", null)
          }
        }
      }

      dynamic "expiration" {
        for_each = lookup(rule.value, "expiration", {})

        content {
          date                         = try(
            expiration.value.date,
            null
          )
          days                         = try(
            expiration.value.days,
            expiration.value,
            null
          )
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lookup(rule.value, "noncurrent_version_expiration", {})

        content {
          noncurrent_days = try(
            noncurrent_version_expiration.value.days,
            noncurrent_version_expiration.value,
            null
          )
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = lookup(rule.value, "noncurrent_version_transition", {})

        content {
          noncurrent_days = try(
            noncurrent_version_transition.value.days,
            noncurrent_version_transition.value,
            null
          )
          storage_class   = noncurrent_version_transition.key
        }
      }

      dynamic "transition" {
        for_each = lookup(rule.value, "transition", {})

        content {
          days          = try(
            transition.value.days,
            transition.value,
            null
          )
          storage_class = transition.key
        }
      }
    }
  }
}
