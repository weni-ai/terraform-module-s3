data "aws_iam_policy" "policy" {
  //for_each = {
  //  for k, v in local.attach_policy_to_role : "${v.policy_key}${v.role_key}" => v
  //}
  for_each = toset(flatten(
    try(var.extra_policy[*], [])
  ))
  name = each.value
  tags = local.common_tags

  depends_on = [
    resource.aws_iam_policy.extra_custom_policy
  ]
}

resource "aws_iam_role_policy_attachment" "attach-policy-to-role" {
  #for_each = {
  #  for k, v in local.attach_policy_to_role : "${v.policy_key}${v.role_key}" => v
  #}
  for_each = toset(flatten(
    try(var.extra_policy[*], [])
  ))

  #role = aws_iam_role.role[each.value.role_key].name
  role = var.bucket_name

  policy_arn = data.aws_iam_policy.policy[each.value].arn
}
