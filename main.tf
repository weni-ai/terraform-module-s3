resource "aws_s3_bucket" "bucket" {
  count = var.create ? 1 : 0

  bucket = var.bucket_name

  tags = merge(
    local.common_tags,
    {
      Name = var.bucket_name
    }
  )

  lifecycle {
    ignore_changes = [
      tags["CreateTimestamp"]
    ]
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_restrict_access" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id

  block_public_acls       = var.bucket_type == "private" ? true : false
  block_public_policy     = var.bucket_type == "private" ? true : false
  ignore_public_acls      = var.bucket_type == "private" ? true : false
  restrict_public_buckets = var.bucket_type == "private" ? true : false
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "bucket_tiering" {
  count = var.create ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id
  name   = "EntireBucket"


  dynamic "tiering" {
    for_each = var.intelligent_tiering

    content {
      access_tier = tiering.key
      days        = tiering.value
    }
  }

  #tiering {
  #  access_tier = "DEEP_ARCHIVE_ACCESS"
  #  days        = var.tiering_deep_archive_access
  #}

  #tiering {
  #  access_tier = "ARCHIVE_ACCESS"
  #  days        = var.tiering_archive_access
  #}

  status = length(var.intelligent_tiering)>0 ? "Enabled" : "Disabled"
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  count = var.create && var.bucket_type == "public" ? 1 : 0

  bucket = aws_s3_bucket.bucket[0].id
  policy = data.aws_iam_policy_document.allow_public_access[0].json
}

resource "aws_s3_bucket_cors_configuration" "bucket_cors" {
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
