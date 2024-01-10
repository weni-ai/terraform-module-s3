resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id

  rule {
    id = "Transition to Glacier Instant Retrieval"

    transition {
      storage_class = "GLACIER_IR"
      days          = var.glacier_days
    }

    status = var.glacier_enabled ? "Enabled" : "Disabled"
  }

  rule {
    id = "Transition to Standard-IA"

    transition {
      storage_class = "STANDARD_IA"
      days          = var.infrequent_access_days
    }

    status = var.infrequent_access_enabled ? "Enabled" : "Disabled"
  }

  rule {
    id = "Expires"

    expiration {
      days = var.expiration_objects_days
    }

    status = var.expiration_objects_enabled ? "Enabled" : "Disabled"
  }
}
