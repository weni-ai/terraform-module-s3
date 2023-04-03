resource "aws_s3_bucket_cors_configuration" "example" {
  count = var.enable ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id

  dynamic "cors_rule" {
    for_each = var.cors_rule

    content {
      id              = try(cors_rule.value.id, null)
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = try(cors_rule.value.allowed_headers, null)
      expose_headers  = try(cors_rule.value.expose_headers, null)
      max_age_seconds = try(cors_rule.value.max_age_seconds, null)
    }
  }

  #dynamic "cors_rule" {
  #  for_each = var.cors_rule

  #  content {
  #    dynamic "el" {
  #      for_each = var.cors_rule

  #      content {
  #        (el.key) = el.value
  #      }
  #    }
  #  }
  #}
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

