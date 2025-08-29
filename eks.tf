data "aws_eks_cluster" "eks" {
  for_each = {
    for eks_id, eks_role in var.create_iam_eks_role: eks_id => eks_role if contains(eks_id, "/")==false
  }
  name = "example"
}

module "iam_eks_role" {
  count = var.create && length(var.create_iam_eks_role) > 0 ? 1 : 0

  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"

  name                = var.bucket_name

  oidc_providers = {
    for eks_id, eks_role in var.create_iam_eks_role: eks_id => {
      provider_arn = try(data.eks[eks_id].oidc_provider_arn, eks_id)
      namespace_service_accounts = eks_role
    }
  }

  #cluster_service_accounts = var.create_iam_eks_role
  #role_policy_arns = merge(
  #  {
  #    for idx, policy in aws_iam_policy.bucket_rw : aws_iam_policy.bucket_rw[idx].name => aws_iam_policy.bucket_rw[idx].arn
  #  }, {
  #    for idx, policy in aws_iam_policy.extra_custom_policy : aws_iam_policy.extra_custom_policy[idx].name => aws_iam_policy.extra_custom_policy[idx].arn
  #  }
  #)
  policies = merge(
    {
      for idx, policy in aws_iam_policy.bucket_rw : aws_iam_policy.bucket_rw[idx].name => aws_iam_policy.bucket_rw[idx].arn
    }, {
      for idx, policy in aws_iam_policy.extra_custom_policy : aws_iam_policy.extra_custom_policy[idx].name => aws_iam_policy.extra_custom_policy[idx].arn
    }
  )


  tags = local.common_tags

  #lifecycle {
  #  ignore_changes = [
  #    tags["CreateTimestamp"]
  #  ]
  #}
}
