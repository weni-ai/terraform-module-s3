data "aws_eks_cluster" "eks" {
  for_each = {
    for eks_id, eks_role in var.create_iam_eks_role: eks_id => eks_role if strcontains(eks_id, "/")==false
  }
  name = each.key
}

module "iam_eks_role" {
  count = var.create && length(var.create_iam_eks_role) > 0 ? 1 : 0

  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"

  name                = var.bucket_name

  oidc_providers = {
    for eks_id, eks_role in var.create_iam_eks_role: eks_id => {
      #provider_arn = try(data.aws_eks_cluster.eks[eks_id].identity.oidc[0], eks_id)
      provider_arn = data.aws_eks_cluster.eks[eks_id].identity[0].oidc[0].issuer
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
