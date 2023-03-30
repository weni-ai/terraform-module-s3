resource "aws_s3_bucket" "bucket" {
  count = var.enable ? 1 : 0
  bucket = join("-", ["weni", var.environment, var.bucketname ])
  tags = local.common_tags
  # cors_rule = var.cors_rule
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "tiering_bucket" {
  bucket = aws_s3_bucket.bucket[0].id
  name   = "Intelligent-Tiering"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 90
  }
}

# resource "aws_s3_bucket_acl" "example_bucket_acl" {
#   bucket = aws_s3_bucket.bucket[0].id
#   acl    = var.type
# }

// vim: nu ts=2 fdm=indent noet ft=terraform:

