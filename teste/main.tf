module "bucket-private" {
  source      = "../"
  bucketname  = "bucket-private"
  environment = "production"
  squad       = "cloud"
}

module "bucket-public" {
  source     = "../"
  bucketname = "bucket-public"
  type       = "public-read"
  squad      = "cloud"
  eks = [
    {
      cluster   = "dev-apps"
      namespace = "chats"
      sa        = "chats"
    }
  ]
}

