locals {
  current_timestamp  = timestamp()
  common_tags = {
    Name = var.bucketname
    Environment = var.environment
    Squad = var.squad
    Service = "S3"
    Managed_By = "Terraform" 
    Created = formatdate("YYYY-MM-DD", local.current_timestamp)
  }
}

