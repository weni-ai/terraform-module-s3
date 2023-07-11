resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_config" {
  bucket = aws_s3_bucket.bucket[0].id
  count  = var.enable ? 1 : 0

  rule {
    id = "move to Glacier Instant Retrieval after x days"

    transition {
      days          = var.glacier-days
      storage_class = "GLACIER_IR"
    }

    status = var.glacier-enable
  }

  rule {
    id = "move to Standard-Infrequent Access after x days"

    transition {
      days          = var.ia-days
      storage_class = "STANDARD_IA"
    }

    status = var.ia-enable
  }

  rule {
    id = "delete all files after x days"

    expiration {
      days = var.delete-days
    }

    status = var.delete-enable
  }
}

## Para entender as classes de armazenamento, consulte a seguinte documentação: https://aws.amazon.com/pt/s3/storage-classes/

// vim: nu ts=2 fdm=indent noet ft=terraform:

