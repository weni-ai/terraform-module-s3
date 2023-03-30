# terraform-module-s3
This module creates an S3 bucket with support for versioning, lifecycles, ACL, bucket object policies.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.bucket-access-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.bucket-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.bucket-user-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_intelligent_tiering_configuration.tiering_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.lifecycle_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.bucket-bucket-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | Atribui nome ao bucket | `string` | `""` | no |
| <a name="input_delete-days"></a> [delete-days](#input\_delete-days) | Define a quantidade de dias para deletar os arquivos | `string` | `"30"` | no |
| <a name="input_delete-enable"></a> [delete-enable](#input\_delete-enable) | Habilita ou desabilita o lifecycle delete-enable | `string` | `"Disabled"` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Variable of IAM | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Define o Ambiente de implantação | `string` | `"develop"` | no |
| <a name="input_glacier-days"></a> [glacier-days](#input\_glacier-days) | Define a quantidade de dias para mover os arquivos | `string` | `"7"` | no |
| <a name="input_glacier-enable"></a> [glacier-enable](#input\_glacier-enable) | Habilita ou desabilita o lifecycle glacier-enable | `string` | `"Disabled"` | no |
| <a name="input_ia-days"></a> [ia-days](#input\_ia-days) | Define a quantidade de dias para mover os arquivos | `string` | `"30"` | no |
| <a name="input_ia-enable"></a> [ia-enable](#input\_ia-enable) | Habilita ou desabilita o lifecycle ia-enable | `string` | `"Disabled"` | no |
| <a name="input_rolename"></a> [rolename](#input\_rolename) | n/a | `string` | `""` | no |
| <a name="input_squad"></a> [squad](#input\_squad) | Define a squad detentora do bucket | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | Define o tipo de ACL | `string` | `"private"` | no |
| <a name="input_username"></a> [username](#input\_username) | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket created |
