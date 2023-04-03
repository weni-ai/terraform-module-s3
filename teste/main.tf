module "bucket-private" {
  source      = "../"
  bucketname  = "bucket-private"
  environment = "production"
  squad       = "cloud"
  rolename    = "weni-s3-bucket"
}

module "bucket-public" {
  source     = "../"
  bucketname = "bucket-public"
  type       = "public-read"
  squad      = "cloud"
  rolename   = "weni-s3-bucket"
  eks = [
    {
      cluster   = "dev-apps"
      namespace = "chats"
      sa        = "chats"
    }
  ]
}

