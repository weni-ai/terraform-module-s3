module "eks-role" {
  count = var.enable ? length(var.eks) : 0
  source  = "reegnz/oidc-provider-data/aws//examples/eks-oidc-role"
  version = "0.0.4"
  eks_cluster_name = var.eks[count.index].cluster
  eks_sa_name      = var.eks[count.index].sa
  eks_sa_namespace = var.eks[count.index].namespace
  role_name        = "${var.bucketname}-${var.eks[count.index].cluster}-${var.eks[count.index].namespace}-${var.eks[count.index].sa}-eks-rw"
}

resource "aws_iam_role_policy_attachment" "eks" {
  count = var.enable ? length(var.eks) : 0
  role = module.eks-role[count.index].role_name
  policy_arn = aws_iam_policy.bucket-rw[0].arn
}

// vim: nu ts=2 fdm=indent noet ft=terraform:

