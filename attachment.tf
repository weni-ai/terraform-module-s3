data "aws_iam_policy" "policy" {
  //for_each = {
  //  for k, v in local.attach_policy_to_role : "${v.policy_key}${v.role_key}" => v
  //}
  for_each = toset(flatten(
    try(var.extra_policy[*], [])
  ))
  name = each.value
  #tags = local.common_tags

  depends_on = [
    resource.aws_iam_policy.extra_custom_policy
  ]
}

resource "aws_iam_role_policy_attachment" "attach-policy-to-role" {
  #for_each = {
  #  for k, v in local.attach_policy_to_role : "${v.policy_key}${v.role_key}" => v
  #}
  for_each = var.create && length(module.iam_eks_role)>0 ? toset(flatten(
    try(var.extra_policy[*], [])
  )) : toset(flatten([]))

  #role = aws_iam_role.role[each.value.role_key].name
  role = var.bucket_name

  policy_arn = data.aws_iam_policy.policy[each.value].arn
  depends_on = [
    module.iam_eks_role
  ]
}

resource "aws_iam_user_policy_attachment" "attach-policy-to-user" {
  for_each = var.create && var.create_iam_user ? toset(flatten(
    try(var.extra_policy[*], [])
  )) : toset(flatten([]))

  user       = aws_iam_user.bucket_user[0].name
  policy_arn = data.aws_iam_policy.policy[each.value].arn

  depends_on = [
    aws_iam_policy.extra_custom_policy,
    aws_iam_policy.bucket_rw,
    aws_iam_user.bucket_user,
  ]
}
