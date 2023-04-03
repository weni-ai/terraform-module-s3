resource "aws_iam_user" "bucket-user" {
  count = var.enable && var.username!="" ? 1 : 0
  name  = "${var.username}"
  tags  = local.common_tags
  #path = "/system/"
}

resource "aws_iam_access_key" "bucket-access-key" {
  count = var.enable && var.username!="" ? 1 : 0
  user = aws_iam_user.bucket-user[0].name
}

resource "aws_iam_user_policy_attachment" "user-rw" {
  count = var.enable && var.username!="" ? 1 : 0
  user = aws_iam_user.bucket-user[0].name
  policy_arn = aws_iam_policy.bucket-rw[0].arn
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

