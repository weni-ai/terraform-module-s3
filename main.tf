/**
 * # terraform-module-s3
 *
 * This module creates an S3 bucket with support for versioning, lifecycles, ACL, bucket object policies.
 *
 * Se a variável enable for definida como true, o módulo provisionará um usuário e secretes do IAM com permissões para acessar o bucket. Os usuários ou sistemas que têm credenciais do IAM devem receber acesso diretamente com base em sua identidade do IAM por meio de private_principal_arns ou ser autorizados a assumir uma função do IAM com acesso.
 * Não recomendamos criar usuários do IAM dessa forma para qualquer outra finalidade. 
 *
 * ## Começando com bucket simples.
 * ```sh
 * module "bucket" {
 *   source      = "git::https://github.com/weni-ai/terraform-module-s3.git"
 *   bucketname  = "bucket-xpto"
 *   environment = "your environmet"
 *   squad       = "your name squad"
 * }
 * ```
 * ## Começando com bucket e role para o eks.
 * ```sh
 * module "bucket" {
 *   source  = "git::https://github.com/weni-ai/terraform-module-s3.git"
 *   bucketname = "bucket-xpto"
 *   environment = "nome do ambiente"
 *   squad       = "nome da squad"
 *   eks = [
 *     {
 *       cluster   = "nome do cluster"
 *       namespace = "nome do name space"
 *       sa        = "nome do service account"
 *    }
 *  ]
 * }
 * ```
 */

resource "aws_s3_bucket" "bucket" {
  count  = var.enable ? 1 : 0
  bucket = join("-", ["weni", var.environment, var.bucketname])
  tags   = local.common_tags
  lifecycle {
    ignore_changes = [
      tags.Created
    ]
  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "tiering_bucket" {
  count  = var.enable ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  name   = "Intelligent-Tiering"

  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = var.deep_archive_access
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = var.archive_access
  }
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

