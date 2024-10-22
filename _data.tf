data "aws_iam_policy_document" "allow_public_access" {
  count = var.create && var.bucket_type == "public" ? 1 : 0

  statement {
    sid = "AllowGetPublic"
    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.bucket[0].arn}",
      "${aws_s3_bucket.bucket[0].arn}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

data "aws_iam_policy_document" "allow_read_write" {
  count = var.create && (var.create_iam_user || length(var.create_iam_eks_role) > 0) ? 1 : 0

  statement {
    sid = "AllowListBucket"
    actions = [
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads"
    ]
    resources = [
      "${aws_s3_bucket.bucket[0].arn}"
    ]
  }

  statement {
    sid = "AllowRWBucket"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListObjects",
      "s3:PutObjectAcl",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
    ]
    resources = [
      "${aws_s3_bucket.bucket[0].arn}/*"
    ]
  }
}

data "aws_canonical_user_id" "current" {}
