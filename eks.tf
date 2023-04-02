# module "eks-role" {
#   count = var.enable && var.rolename!="" ? 1 : 0
#   source  = "reegnz/oidc-provider-data/aws//examples/eks-oidc-role"
#   version = "0.0.4"
#   eks_cluster_name = var.eks_cluster_name
#   eks_sa_name	= var.eks_sa_name
#   eks_sa_namespace = var.eks_sa_namespace
#   role_name = var.rolename	
# }

# resource "aws_iam_role_policy" "s3_policy" {
#   count = var.enable && var.rolename!="" ? 1 : 0   
#   name = var.rolename
#   role = module.eks-role[0].role_name

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#       "Sid": "VisualEditor0",
#       "Effect": "Allow",
#       "Action": "s3:ListBucket",
#       "Resource": "arn:aws:s3:::${var.bucketname}"
#     },
#     {
#       "Sid": "VisualEditor2",
#       "Effect": "Allow",
#       "Action": [
#         "s3:PutObject",
#         "s3:GetObject",
#         "s3:DeleteObject",
#         "s3:ListBucket",
#         "s3:ListObjects",
#         "s3:PutObjectAcl",
#         "s3:GetObjectAcl"
#       ],
#       "Resource": [
#         "arn:aws:s3:::${var.bucketname}/*"
#       ]
#     },
#     ]
#   })
# }