resource "aws_s3_bucket" "bucket" {
  count = var.create ? 1 : 0

  bucket = var.bucket_name

  tags = local.common_tags
  lifecycle {
    ignore_changes = [
      tags["CreateTimestamp"]
    ]
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket_tiering" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id
  name   = "EntireBucket"

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
  count = var.create && var.bucket_acl == "public-read" ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id
  policy = data.aws_iam_policy_document.allow_public_access[0].json
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  count  = var.create && length(var.cors_rules) > 0 ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      id              = try(cors_rule.value.id, null)
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = try(cors_rule.value.allowed_headers, null)
      expose_headers  = try(cors_rule.value.expose_headers, null)
      max_age_seconds = try(cors_rule.value.max_age_seconds, null)
    }
  }
}
