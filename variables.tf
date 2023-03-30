#Varibles of S3
variable "bucketname" {
  description = "Atribui nome ao bucket"
  type    = string
  default = ""
}

variable "type" {
  description = "Define o tipo de ACL"
  type    = string
  default = "private"
  validation {
    condition     = contains(["private", "public-read", "public-read-write", "aws-exec-read", "authenticated-read", "log-delivery-write"], var.type)
    error_message = "ACL inválida, valores permitidos: private, public-read, public-read-write, aws-exec-read, authenticated-read, log-delivery-write."
  }
}

variable "environment" {
  description = "Define o Ambiente de implantação"
  type = string
  default = "develop"
  validation {
    condition     = contains(["production", "develop"], var.environment)
    error_message = "Environment inválida, valores permitidos: production, develop."
  }
}

variable "squad" {
  description = "Define a squad detentora do bucket"
  type = string
  default = ""
}

# Variables of Lifecycle
variable "delete-days" {
  description = "Define a quantidade de dias para deletar os arquivos"
  type    = string
  default = "30"
}

variable "delete-enable" {
  description = "Habilita ou desabilita o lifecycle delete-enable"
  type    = string
  default = "Disabled"
}

variable "glacier-days" {
  description = "Define a quantidade de dias para mover os arquivos"
  type    = string
  default = "7"
}

variable "glacier-enable" {
  description = "Habilita ou desabilita o lifecycle glacier-enable"
  type    = string
  default = "Disabled"
}

variable "ia-days" {
  description = "Define a quantidade de dias para mover os arquivos"
  type    = string
  default = "30"
}

variable "ia-enable" {
  description = "Habilita ou desabilita o lifecycle ia-enable"
  type    = string
  default = "Disabled"
}

# Variable of IAM
variable "enable" {
  type    = bool
  default = true
}

variable "rolename" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

# variable "cors_rule" {
#   type    = map(string)
#   default = {
#     allowed_headers = ["*"]
#     allowed_methods = ["PUT", "HEAD", "POST", "GET"]
#     allowed_origins = ["*.weni.ai"]
#     expose_headers  = ["ETag","Access-Control-Allow-Origin"]
#     max_age_seconds = 3000
#   }
# }

// vim: nu ts=2 fdm=indent noet ft=terraform:

