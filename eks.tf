module "iam_eks_role" {
  count = var.create && length(var.create_iam_eks_role) > 0 ? 1 : 0

  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name                = var.bucket_name
  cluster_service_accounts = var.create_iam_eks_role
  role_policy_arns = merge({
    for idx, policy in aws_iam_policy.bucket_rw : aws_iam_policy.bucket_rw[idx].name => aws_iam_policy.bucket_rw[idx].arn
  },{
    for idx, policy in aws_iam_policy.extra_custom_policy : aws_iam_policy.extra_custom_policy[idx].name => aws_iam_policy.extra_custom_policy[idx].arn
  })
}
