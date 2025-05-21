variable "create" {
  type    = bool
  default = true
}

variable "bucket_name" {
  type = string
}

variable "bucket_type" {
  type    = string
  default = "private"

  validation {
    condition     = var.bucket_type == "public" || var.bucket_type == "private"
    error_message = "Valid values are 'public' or 'private'"
  }
}

variable "tiering_archive_enabled" {
  type    = bool
  default = false
}

variable "tiering_deep_archive_access" {
  type    = number
  default = 180
}

variable "tiering_archive_access" {
  type    = number
  default = 90
}

variable "intelligent_tiering" {
  #type    = list(any)
  default = []
}

# lifecycle
variable "infrequent_access_enabled" {
  type    = bool
  default = false
}

variable "infrequent_access_days" {
  type    = number
  default = 7
}

variable "intelligent_tiering_enabled" {
  type    = bool
  default = false
}

variable "intelligent_tiering_days" {
  type    = number
  default = 7
}

variable "glacier_enabled" {
  type    = bool
  default = false
}

variable "glacier_days" {
  type    = number
  default = 30
}

variable "expiration_objects_enabled" {
  type    = bool
  default = false
}

variable "expiration_objects_days" {
  type    = number
  default = 90
}

variable "create_iam_user" {
  type    = bool
  default = false
}

variable "create_iam_user_write_acl" {
  type    = bool
  default = false
  description = "If iam user can use WRITE_ACP on bucket"
}

variable "create_iam_eks_role" {
  type    = any
  default = {}
}

variable "extra_custom_policy" {
  type    = any
  default = {}
}

variable "extra_lifecycle" {
  type    = any
  default = {}
}

variable "extra_policy" {
  type    = list(string)
  default = []
}

variable "cors_rules" {
  #type = list(any)
  default = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "HEAD", "POST", "GET"]
      allowed_origins = ["*.weni.ai"]
      expose_headers  = ["ETag", "Access-Control-Allow-Origin"]
      max_age_seconds = 3000
    }
  ]
  nullable = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
