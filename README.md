## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_eks_role"></a> [iam\_eks\_role](#module\_iam\_eks\_role) | terraform-aws-modules/iam/aws//modules/iam-eks-role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.bucket_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.bucket_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.bucket_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.bucket_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_cors_configuration.bucket_cors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_intelligent_tiering_configuration.bucket_tiering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.bucket_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.bucket_restrict_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.allow_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_read_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_bucket_type"></a> [bucket\_type](#input\_bucket\_type) | n/a | `string` | `"private"` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | n/a | `list(any)` | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "PUT",<br>      "HEAD",<br>      "POST",<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*.weni.ai"<br>    ],<br>    "expose_headers": [<br>      "ETag",<br>      "Access-Control-Allow-Origin"<br>    ],<br>    "max_age_seconds": 3000<br>  }<br>]</pre> | no |
| <a name="input_create"></a> [create](#input\_create) | n/a | `bool` | `true` | no |
| <a name="input_create_iam_eks_role"></a> [create\_iam\_eks\_role](#input\_create\_iam\_eks\_role) | n/a | `map(any)` | `{}` | no |
| <a name="input_create_iam_user"></a> [create\_iam\_user](#input\_create\_iam\_user) | n/a | `bool` | `false` | no |
| <a name="input_expiration_objects_days"></a> [expiration\_objects\_days](#input\_expiration\_objects\_days) | n/a | `number` | `90` | no |
| <a name="input_expiration_objects_enabled"></a> [expiration\_objects\_enabled](#input\_expiration\_objects\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_glacier_days"></a> [glacier\_days](#input\_glacier\_days) | n/a | `number` | `7` | no |
| <a name="input_glacier_enabled"></a> [glacier\_enabled](#input\_glacier\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_infrequent_access_days"></a> [infrequent\_access\_days](#input\_infrequent\_access\_days) | n/a | `number` | `30` | no |
| <a name="input_infrequent_access_enabled"></a> [infrequent\_access\_enabled](#input\_infrequent\_access\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tiering_archive_access"></a> [tiering\_archive\_access](#input\_tiering\_archive\_access) | n/a | `number` | `90` | no |
| <a name="input_tiering_deep_archive_access"></a> [tiering\_deep\_archive\_access](#input\_tiering\_deep\_archive\_access) | n/a | `number` | `180` | no |
| <a name="input_tiering_enabled"></a> [tiering\_enabled](#input\_tiering\_enabled) | n/a | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_access_key"></a> [aws\_access\_key](#output\_aws\_access\_key) | IAM access key for S3 bucket |
| <a name="output_aws_secret_key"></a> [aws\_secret\_key](#output\_aws\_secret\_key) | IAM secret key for S3 bucket |
| <a name="output_eks_role"></a> [eks\_role](#output\_eks\_role) | IAM role ARN for EKS cluster |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_eks_role"></a> [iam\_eks\_role](#module\_iam\_eks\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.bucket_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.bucket_rw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.extra_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.attach-policy-to-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.bucket_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.attach-policy-to-user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.bucket_user_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.extra_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_acl.grant_owner_to_iam](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.bucket_cors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_intelligent_tiering_configuration.bucket_tiering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_intelligent_tiering_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.bucket_lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_ownership_controls.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.bucket_restrict_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_eks_cluster.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.allow_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.allow_read_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | ACL usada no bucket (ex: public-read, private) | `string` | `null` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | n/a | `string` | n/a | yes |
| <a name="input_bucket_type"></a> [bucket\_type](#input\_bucket\_type) | n/a | `string` | `"private"` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | n/a | `list` | <pre>[<br>  {<br>    "allowed_headers": [<br>      "*"<br>    ],<br>    "allowed_methods": [<br>      "PUT",<br>      "HEAD",<br>      "POST",<br>      "GET"<br>    ],<br>    "allowed_origins": [<br>      "*.weni.ai"<br>    ],<br>    "expose_headers": [<br>      "ETag",<br>      "Access-Control-Allow-Origin"<br>    ],<br>    "max_age_seconds": 3000<br>  }<br>]</pre> | no |
| <a name="input_create"></a> [create](#input\_create) | n/a | `bool` | `true` | no |
| <a name="input_create_iam_eks_role"></a> [create\_iam\_eks\_role](#input\_create\_iam\_eks\_role) | n/a | `any` | `{}` | no |
| <a name="input_create_iam_user"></a> [create\_iam\_user](#input\_create\_iam\_user) | n/a | `bool` | `false` | no |
| <a name="input_create_iam_user_write_acl"></a> [create\_iam\_user\_write\_acl](#input\_create\_iam\_user\_write\_acl) | If iam user can use WRITE\_ACP on bucket | `bool` | `false` | no |
| <a name="input_enable_acl"></a> [enable\_acl](#input\_enable\_acl) | Define se o recurso ACL será criado | `bool` | `false` | no |
| <a name="input_expiration_objects_days"></a> [expiration\_objects\_days](#input\_expiration\_objects\_days) | n/a | `number` | `90` | no |
| <a name="input_expiration_objects_enabled"></a> [expiration\_objects\_enabled](#input\_expiration\_objects\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_extra_custom_policy"></a> [extra\_custom\_policy](#input\_extra\_custom\_policy) | n/a | `any` | `{}` | no |
| <a name="input_extra_lifecycle"></a> [extra\_lifecycle](#input\_extra\_lifecycle) | n/a | `any` | `{}` | no |
| <a name="input_extra_policy"></a> [extra\_policy](#input\_extra\_policy) | n/a | `list(string)` | `[]` | no |
| <a name="input_glacier_days"></a> [glacier\_days](#input\_glacier\_days) | n/a | `number` | `30` | no |
| <a name="input_glacier_enabled"></a> [glacier\_enabled](#input\_glacier\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_infrequent_access_days"></a> [infrequent\_access\_days](#input\_infrequent\_access\_days) | n/a | `number` | `7` | no |
| <a name="input_infrequent_access_enabled"></a> [infrequent\_access\_enabled](#input\_infrequent\_access\_enabled) | lifecycle | `bool` | `false` | no |
| <a name="input_intelligent_tiering"></a> [intelligent\_tiering](#input\_intelligent\_tiering) | n/a | `list` | `[]` | no |
| <a name="input_intelligent_tiering_days"></a> [intelligent\_tiering\_days](#input\_intelligent\_tiering\_days) | n/a | `number` | `7` | no |
| <a name="input_intelligent_tiering_enabled"></a> [intelligent\_tiering\_enabled](#input\_intelligent\_tiering\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tiering_archive_access"></a> [tiering\_archive\_access](#input\_tiering\_archive\_access) | n/a | `number` | `90` | no |
| <a name="input_tiering_archive_enabled"></a> [tiering\_archive\_enabled](#input\_tiering\_archive\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_tiering_deep_archive_access"></a> [tiering\_deep\_archive\_access](#input\_tiering\_deep\_archive\_access) | n/a | `number` | `180` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_access_key"></a> [aws\_access\_key](#output\_aws\_access\_key) | IAM access key for S3 bucket |
| <a name="output_aws_secret_key"></a> [aws\_secret\_key](#output\_aws\_secret\_key) | IAM secret key for S3 bucket |
| <a name="output_eks_role"></a> [eks\_role](#output\_eks\_role) | IAM role ARN for EKS cluster |
<!-- END_TF_DOCS -->