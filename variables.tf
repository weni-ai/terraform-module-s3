#Variables of ative or no the module
variable "enable" {
  description = "Defina como `true` para criar um usuário IAM com permissão para acessar o bucket"
  type        = bool
  default     = true
}

#Varibles of S3
variable "bucketname" {
  description = "Atribui nome ao bucket. Deve se fornecido, o bucket será criado com este nome e deve ser um nome único"
  type        = string
}

variable "type" {
  description = "Define o tipo de ACL"
  type        = string
  default     = "private"
  validation {
    condition     = contains(["private", "public-read"], var.type)
    error_message = "ACL inválida, valores permitidos: private, public-read."
  }
}

variable "environment" {
  description = <<-EOT
    Define o Ambiente de implantação. Deve ser fornecido o nome do ambiente em que
    o bucket será implatado. Vide a lista dos ambeintes abaixo.
    EOT
  type        = string
  validation {
    condition     = contains(["production", "prod", "develop", "staging", "nonprod"], var.environment)
    error_message = "Environment inválida, valores permitidos: production, prod, develop, staging, nonprod."
  }
}

variable "squad" {
  description = "Define a squad detentora do bucket"
  type        = string
}

# Variables of Lifecycle
variable "delete-days" {
  description = "Define a quantidade de dias para deletar os arquivos"
  type        = string
  default     = "30"
}

variable "delete-enable" {
  description = "Habilita ou desabilita o lifecycle delete-enable"
  type        = string
  default     = "Disabled"
}

variable "glacier-days" {
  description = "Define a quantidade de dias para mover os arquivos"
  type        = string
  default     = "7"
}

variable "glacier-enable" {
  description = "Habilita ou desabilita o lifecycle glacier-enable"
  type        = string
  default     = "Disabled"
}

variable "ia-days" {
  description = "Define a quantidade de dias para mover os arquivos"
  type        = string
  default     = "30"
}

variable "ia-enable" {
  description = "Habilita ou desabilita o lifecycle ia-enable"
  type        = string
  default     = "Disabled"
}

# Variables of intelligent tiering

variable "deep_archive_access" {
  description = "Define a quantidade de dias para mover os arquivos para deep_archive_access"
  type        = number
  default     = 180
}

variable "archive_access" {
  description = "Define a quantidade de dias para mover os arquivos para archive_access "
  type        = number
  default     = 90
}

# Variable of IAM
variable "username" {
  description = "value"
  type        = string
  default     = ""
}

# Variable of module EKS
variable "eks" {
  description = "Cria roles de escrita e leitura para serem usadas no EKS"
  type = list(object({
    cluster   = string
    sa        = string
    namespace = string
  }))
  default = []
}

variable "tags" {
  description = "Define a squad detentora do bucket"
  type        = map(any)
  default = {
    Service    = "S3"
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
      expose_headers  = ["ETag", "Access-Control-Allow-Origin"]
      max_age_seconds = 3000
    }
  ]
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

