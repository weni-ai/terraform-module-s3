resource "aws_iam_user" "bucket-user" {
  count = var.enable && var.username!="" ? 1 : 0
  name = "${local.s3-bucket.username}"
  #path = "/system/"
}

resource "aws_iam_access_key" "bucket-access-key" {
  count = var.enable && var.username!="" ? 1 : 0
  user = aws_iam_user.bucket-user[0].name
}

resource "aws_iam_user_policy" "bucket-user-policy" {
  count = var.enable && var.username!="" ? 1 : 0
  user = aws_iam_user.bucket-user[0].name
  name = var.username
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::${local.s3-bucket.bucket_name}"
    },
    {
      "Sid": "VisualEditor2",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:ListObjects",
        "s3:PutObjectAcl",
        "s3:GetObjectAcl"
      ],
      "Resource": [
        "arn:aws:s3:::${local.s3-bucket.bucket_name}/*"
      ]
    }
  ]
}
EOF
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

