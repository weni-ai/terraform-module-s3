resource "aws_s3_bucket_ownership_controls" "bucket_acl" {
  count = var.create && var.create_iam_user && var.create_iam_user_write_acl ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "grant_owner_to_iam" {
  count = var.create && var.create_iam_user && var.create_iam_user_write_acl ? 1 : 0
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_acl[0],
    aws_iam_user.bucket_user[0],
  ]

  bucket = aws_s3_bucket.bucket[0].id
  access_control_policy {
    grant {
      grantee {
        id   = aws_iam_user.bucket_user[0].unique_id
        type = "CanonicalUser"
      }
      permission = "WRITE_ACP"
    }

    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/s3/LogDelivery"
      }
      permission = "READ_ACP"
    }

    owner {
      id = aws_iam_user.bucket_user[0].unique_id
    }
  }
}
