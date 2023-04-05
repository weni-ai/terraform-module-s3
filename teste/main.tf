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
      namespace = "chats-develop"
      sa        = "chats"
    }
  ]
}

module "bucket-public-multiple-eks" {
  source     = "../"
  bucketname = "bucket-public-multiple-eks"
  type       = "public-read"
  squad      = "cloud"
  eks = [
    {
      cluster   = "dev-apps"
      namespace = "chats-develop"
      sa        = "chats"
    },
    {
      cluster   = "dev-apps"
      namespace = "flows-develop"
      sa        = "chats"
    }
  ]
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

