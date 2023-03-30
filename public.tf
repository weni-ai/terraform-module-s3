resource "aws_s3_bucket_policy" "bucket-bucket-policy" {
  count = var.enable && var.type=="public-read" ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = [
          "s3:GetObject",
          "s3:GetObjectAcl",
        ]
        Resource = [
          aws_s3_bucket.bucket[0].arn,
          "${aws_s3_bucket.bucket[0].arn}/*",
        ]
      }
    ]
  })
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

