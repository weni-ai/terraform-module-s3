resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket_tiering" {
  bucket = aws_s3_bucket.bucket.id

  name = "EntireBucket"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = var.tiering_deep_archive_access
  }

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = var.tiering_archive_access
  }

  status = var.tiering_enabled ? "Enabled" : "Disabled"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  count  = length(var.cors_rules)
  bucket = aws_s3_bucket.bucket.id

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      id              = try(cors_rules.value.id, null)
      allowed_methods = cors_rules.value.allowed_methods
      allowed_origins = cors_rules.value.allowed_origins
      allowed_headers = try(cors_rules.value.allowed_headers, null)
      expose_headers  = try(cors_rules.value.expose_headers, null)
      max_age_seconds = try(cors_rules.value.max_age_seconds, null)
    }
  }
}
