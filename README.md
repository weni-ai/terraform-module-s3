# terraform-module-s3

This module creates an S3 bucket with support for versioning, lifecycles, ACL, bucket object policies.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks-role"></a> [eks-role](#module\_eks-role) | reegnz/oidc-provider-data/aws//examples/eks-oidc-role | 0.0.4 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.bucket-access-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.bucket-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.bucket-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.user-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_cors_configuration.cors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_intelligent_tiering_configuration.tiering_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.lifecycle_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.bucket-bucket-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.bucket-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_archive_access"></a> [archive\_access](#input\_archive\_access) | Define a quantidade de dias para mover os arquivos para archive\_access | `number` | `90` | no |
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | Atribui nome ao bucket | `string` | n/a | yes |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | Variables of CORS | `list` | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "PUT",<br>      "HEAD",<br>      "POST",<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*.weni.ai"<br>    ],<br>    "expose_headers": [<br>      "ETag",<br>      "Access-Control-Allow-Origin"<br>    ],<br>    "max_age_seconds": 3000<br>  }<br>]</pre> | no |
| <a name="input_deep_archive_access"></a> [deep\_archive\_access](#input\_deep\_archive\_access) | Define a quantidade de dias para mover os arquivos para deep\_archive\_access | `number` | `180` | no |
| <a name="input_delete-days"></a> [delete-days](#input\_delete-days) | Define a quantidade de dias para deletar os arquivos | `string` | `"30"` | no |
| <a name="input_delete-enable"></a> [delete-enable](#input\_delete-enable) | Habilita ou desabilita o lifecycle delete-enable | `string` | `"Disabled"` | no |
| <a name="input_eks"></a> [eks](#input\_eks) | Cria roles de escrita e leitura para serem usadas no EKS | <pre>list(object({<br>    cluster = string<br>    sa = string<br>    namespace = string<br>  }))</pre> | `[]` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Variables of ative or no the module | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Define o Ambiente de implantação | `string` | n/a | yes |
| <a name="input_glacier-days"></a> [glacier-days](#input\_glacier-days) | Define a quantidade de dias para mover os arquivos | `string` | `"7"` | no |
| <a name="input_glacier-enable"></a> [glacier-enable](#input\_glacier-enable) | Habilita ou desabilita o lifecycle glacier-enable | `string` | `"Disabled"` | no |
| <a name="input_ia-days"></a> [ia-days](#input\_ia-days) | Define a quantidade de dias para mover os arquivos | `string` | `"30"` | no |
| <a name="input_ia-enable"></a> [ia-enable](#input\_ia-enable) | Habilita ou desabilita o lifecycle ia-enable | `string` | `"Disabled"` | no |
| <a name="input_squad"></a> [squad](#input\_squad) | Define a squad detentora do bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Define a squad detentora do bucket | `map` | <pre>{<br>  "Managed_By": "Terraform",<br>  "Service": "S3"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | Define o tipo de ACL | `string` | `"private"` | no |
| <a name="input_username"></a> [username](#input\_username) | Variable of IAM | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket created |

<!-- BEGIN_TF_DOCS -->
# terraform-module-s3

This module creates an S3 bucket with support for versioning, lifecycles, ACL, bucket object policies.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks-role"></a> [eks-role](#module\_eks-role) | reegnz/oidc-provider-data/aws//examples/eks-oidc-role | 0.0.4 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.bucket-access-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.bucket-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.bucket-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.user-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_cors_configuration.cors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_intelligent_tiering_configuration.tiering_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.lifecycle_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.bucket-bucket-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_iam_policy_document.bucket-rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_archive_access"></a> [archive\_access](#input\_archive\_access) | Define a quantidade de dias para mover os arquivos para archive\_access | `number` | `90` | no |
| <a name="input_bucketname"></a> [bucketname](#input\_bucketname) | Atribui nome ao bucket | `string` | n/a | yes |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | Variables of CORS | `list` | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "PUT",<br>      "HEAD",<br>      "POST",<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*.weni.ai"<br>    ],<br>    "expose_headers": [<br>      "ETag",<br>      "Access-Control-Allow-Origin"<br>    ],<br>    "max_age_seconds": 3000<br>  }<br>]</pre> | no |
| <a name="input_deep_archive_access"></a> [deep\_archive\_access](#input\_deep\_archive\_access) | Define a quantidade de dias para mover os arquivos para deep\_archive\_access | `number` | `180` | no |
| <a name="input_delete-days"></a> [delete-days](#input\_delete-days) | Define a quantidade de dias para deletar os arquivos | `string` | `"30"` | no |
| <a name="input_delete-enable"></a> [delete-enable](#input\_delete-enable) | Habilita ou desabilita o lifecycle delete-enable | `string` | `"Disabled"` | no |
| <a name="input_eks"></a> [eks](#input\_eks) | Cria roles de escrita e leitura para serem usadas no EKS | <pre>list(object({<br>    cluster = string<br>    sa = string<br>    namespace = string<br>  }))</pre> | `[]` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Variables of ative or no the module | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Define o Ambiente de implantação | `string` | n/a | yes |
| <a name="input_glacier-days"></a> [glacier-days](#input\_glacier-days) | Define a quantidade de dias para mover os arquivos | `string` | `"7"` | no |
| <a name="input_glacier-enable"></a> [glacier-enable](#input\_glacier-enable) | Habilita ou desabilita o lifecycle glacier-enable | `string` | `"Disabled"` | no |
| <a name="input_ia-days"></a> [ia-days](#input\_ia-days) | Define a quantidade de dias para mover os arquivos | `string` | `"30"` | no |
| <a name="input_ia-enable"></a> [ia-enable](#input\_ia-enable) | Habilita ou desabilita o lifecycle ia-enable | `string` | `"Disabled"` | no |
| <a name="input_squad"></a> [squad](#input\_squad) | Define a squad detentora do bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Define a squad detentora do bucket | `map` | <pre>{<br>  "Managed_By": "Terraform",<br>  "Service": "S3"<br>}</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | Define o tipo de ACL | `string` | `"private"` | no |
| <a name="input_username"></a> [username](#input\_username) | Variable of IAM | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket created |
<!-- END_TF_DOCS -->