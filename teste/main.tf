module "bulcket-private" {
  source = "../"
  bucketname = "bucket-private"
  environment = "production"
  squad = "cloud"
  rolename = "weni-s3-bucket"
}

module "bulcket-public" {
  source = "../"
  bucketname = "bucket-public"
  type = "public-read"
  squad = "cloud"
  rolename = "weni-s3-bucket"
}

