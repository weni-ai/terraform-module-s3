module "iam_eks_role" {
  count = length(var.create_iam_eks_role)

  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name                = var.bucket_name
  cluster_service_accounts = var.create_iam_eks_role
  role_policy_arns = {
    (aws_iam_policy.bucket_rw[0].name) = aws_iam_policy.bucket_rw[0].arn
  }
}
