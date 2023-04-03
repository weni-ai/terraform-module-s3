data "aws_iam_policy_document" "bucket-rw" {
  count = var.enable ? 1 : 0
  statement {
    sid = "listBucket"
    actions = ["s3:ListBucket"]
    resources = [
      "arn:aws:s3:::${var.bucketname}"
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
      "arn:aws:s3:::${var.bucketname}/*"
    ]
  }
}

resource "aws_iam_policy" "bucket-rw" {
  name   = "${var.bucketname}-rw"
  count  = var.enable ? 1 : 0
  policy = data.aws_iam_policy_document.bucket-rw[0].json
  #path   = "/"
  tags = local.common_tags
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

