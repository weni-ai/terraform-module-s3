resource "aws_iam_user" "bucket_user" {
  count = var.create && var.create_iam_user ? 1 : 0

  name = var.bucket_name
  tags = local.common_tags

  lifecycle {
    ignore_changes = [
      tags["CreateTimestamp"]
    ]
  }
}

resource "aws_iam_access_key" "bucket_access_key" {
  count = var.create && var.create_iam_user ? 1 : 0

  user = aws_iam_user.bucket_user[0].name
}

resource "aws_iam_user_policy_attachment" "bucket_user_policy" {
  count = var.create && var.create_iam_user ? 1 : 0

  user       = aws_iam_user.bucket_user[0].name
  policy_arn = aws_iam_policy.bucket_rw[0].arn
}

resource "aws_iam_policy" "bucket_rw" {
  count = var.create && (var.create_iam_user || length(var.create_iam_eks_role) > 0) ? 1 : 0

  name   = "${var.bucket_name}-rw"
  policy = data.aws_iam_policy_document.allow_read_write[0].json

  description = "Provides read-write access to the '${var.bucket_name}' S3 bucket"
}
