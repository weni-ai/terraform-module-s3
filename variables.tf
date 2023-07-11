#Variables of ative or no the module
variable "enable" {
  type    = bool
  default = true
}

#Varibles of S3
variable "bucketname" {
  description = "Atribui nome ao bucket"
  type    = string
}

variable "type" {
  description = "Define o tipo de ACL"
  type    = string
  default = "private"
  validation {
    condition     = contains(["private", "public-read"], var.type)
    error_message = "ACL inválida, valores permitidos: private, public-read."
  }
}

variable "environment" {
  description = "Define o Ambiente de implantação"
  type = string
  validation {
    condition     = contains(["production", "prod", "develop", "staging", "nonprod"], var.environment)
    error_message = "Environment inválida, valores permitidos: production, prod, develop, staging, nonprod."
  }
}

variable "squad" {
  description = "Define a squad detentora do bucket"
  type = string
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

# Variables of intelligent tiering

variable "deep_archive_access" {
  description = "Define a quantidade de dias para mover os arquivos para deep_archive_access"
  type = number
  default = 180
}

variable "archive_access" {
  description = "Define a quantidade de dias para mover os arquivos para archive_access "
  type = number
  default = 90
}

# Variable of IAM
variable "username" {
  type    = string
  default = ""
}

# Variable of module EKS
variable "eks" {
  description = "Cria roles de escrita e leitura para serem usadas no EKS"
  type    = list(object({
    cluster = string
    sa = string
    namespace = string
  }))
  default = []
}

variable "tags" {
  description = "Define a squad detentora do bucket"
  type = map
  default = {
    Service = "S3"
    Managed_By = "Terraform"
  }
}

# Variables of CORS
variable "cors_rule" {
  default = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "HEAD", "POST", "GET"]
      allowed_origins = ["*.weni.ai"]
      expose_headers  = ["ETag","Access-Control-Allow-Origin"]
      max_age_seconds = 3000
    }
  ]
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

