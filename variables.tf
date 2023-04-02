#Variables of ative or no the module
variable "enable" {
  type    = bool
  default = true
}

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
    condition     = contains(["private", "public-read"], var.type)
    error_message = "ACL inválida, valores permitidos: private, public-read."
  }
}

variable "environment" {
  description = "Define o Ambiente de implantação"
  type = string
  default = "develop"
  validation {
    condition     = contains(["production", "develop", "staging"], var.environment)
    error_message = "Environment inválida, valores permitidos: production, develop, staging."
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
variable "username" {
  type    = string
  default = ""
}

# Variable of module EKS
variable "eks_cluster_name" {
  type    = string
  default = "eks-production"
}

variable "eks_sa_name" {
  type    = string
  default = ""
}

variable "eks_sa_namespace" {
  type    = string
  default = ""
}

variable "rolename" {
  type    = string
  default = ""
}

# VAriables of Roles 
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

