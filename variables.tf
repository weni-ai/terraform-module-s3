variable "enable" {
  type    = bool
  default = false
}

variable "type" {
  type    = string
  default = "public"
}

variable "rolename" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

variable "bucketname" {
  type    = string
  default = ""
}

variable "delete-days" {
  type    = string
  default = "90"
}

variable "delete-enable" {
  type    = bool
  default = false
}

variable "glacier-days" {
  type    = string
  default = "60"
}

variable "glacier-enable" {
  type    = bool
  default = false
}

variable "ia-days" {
  type    = string
  default = "90"
}

variable "ia-enable" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {
    Name  = var.bucketname
  }
}

variable "cors_rule" {
  type    = map(string)
  default = {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "HEAD", "POST", "GET"]
    allowed_origins = ["*.weni.ai"]
    expose_headers  = ["ETag","Access-Control-Allow-Origin"]
    max_age_seconds = 3000
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

