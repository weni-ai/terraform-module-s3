variable "bucket_name" {
  type = string
}

variable "bucket_acl" {
  type     = string
  default  = "private"
  nullable = false

  validation {
    condition     = var.bucket_acl == "public-read" || var.bucket_acl == "private"
    error_message = "Valid values are 'public-read' or 'private'"
  }
}

variable "tiering_enabled" {
  type     = bool
  default  = true
  nullable = false
}

variable "tiering_deep_archive_access" {
  type     = number
  default  = 180
  nullable = false
}

variable "tiering_archive_access" {
  type     = number
  default  = 90
  nullable = false
}

variable "glacier_enabled" {
  type     = bool
  default  = false
  nullable = false
}

variable "glacier_days" {
  type     = number
  default  = 7
  nullable = false
}

variable "infrequent_access_enabled" {
  type     = bool
  default  = false
  nullable = false
}

variable "infrequent_access_days" {
  type     = number
  default  = 30
  nullable = false
}

variable "expiration_objects_enabled" {
  type     = bool
  default  = false
  nullable = false
}

variable "expiration_objects_days" {
  type     = number
  default  = 90
  nullable = false
}

variable "create_iam_user" {
  type     = bool
  default  = false
  nullable = false
}

variable "create_iam_eks_role" {
  type     = map(any)
  default  = {}
  nullable = false
}

variable "cors_rules" {
  type = list(any)
  default = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "HEAD", "POST", "GET"]
      allowed_origins = ["*.weni.ai"]
      expose_headers  = ["ETag", "Access-Control-Allow-Origin"]
      max_age_seconds = 3000
    }
  ]
}

variable "tags" {
  type    = map(string)
  default = {}
}
