data "aws_iam_policy_document" "bucket-rw" {
  count = var.enable ? 1 : 0
  statement {
    sid = "listBucket"
    actions = ["s3:ListBucket"]
    resources = [
      "${aws_s3_bucket.bucket[0].arn}"
    ]
  }
  statement {
    sid = "RWBucket"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListObjects",
      "s3:PutObjectAcl",
    ]
    resources = [
      "${aws_s3_bucket.bucket[0].arn}"
    ]
  }
}

resource "aws_iam_policy" "bucket-rw" {
  name   = "${aws_s3_bucket.bucket.arn}-rw"
  count  = var.enable ? 1 : 0
  policy = data.aws_iam_policy_document.bucket-rw[0].json
  #path   = "/"
  tags = local.common_tags
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

