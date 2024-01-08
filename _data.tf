data "aws_iam_policy_document" "allow_public_access" {
  statement {
    sid = "AllowGetPublic"
    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
    ]

    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "allow_read_write" {
  statement {
    sid = "AllowListBucket"
    actions = [
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads"
    ]
    resources = [
      "${aws_s3_bucket.bucket.arn}"
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
      "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}
