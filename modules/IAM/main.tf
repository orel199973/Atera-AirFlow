data "aws_iam_policy_document" "this" {
  for_each = var.create ? toset(["document"]) : toset([])
  dynamic "statement" {
    for_each = var.statement
    content {
      sid     = statement.value.sid
      actions = statement.value.actions
      effect  = statement.value.effect

      dynamic "principals" {
        for_each = lookup(statement.value,"principals",null)
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }
      dynamic "condition" {
        for_each = lookup(statement.value,"condition",{})
        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}

resource "aws_iam_role" "this" {
  name                = var.name
  assume_role_policy  = var.create ? data.aws_iam_policy_document.this["document"].json : jsonencode({
    Statement = [
      {
        Action = lookup(var.iam_role.assume_role_policy, "Action", ["sts:AssumeRole"])
        Effect = lookup(var.iam_role.assume_role_policy, "Effect", "Allow")
        Sid    = lookup(var.iam_role.assume_role_policy, "Sid", "")
        Principal = {
          Service = var.iam_role.assume_role_policy.Principal.Service #"ec2.amazonaws.com"
        }
      },
    ]
  })
  description         = lookup(var.iam_role, "description", null)
  dynamic "inline_policy" {
    for_each = lookup(var.iam_role,"inline_policy",null) != null ? toset(["inline_policy"]) : toset([])
    content {
        name = inline_policy.value.name
        policy = inline_policy.value.policy
    }
  }      
  managed_policy_arns = lookup(var.iam_role, "managed_policy_arns",null)

  lifecycle {
    ignore_changes = [
      assume_role_policy,
    ]
  }
}
# resource "aws_iam_policy" "this" {
#   for_each    = var.iam_policy != null  ? toset([]) : toset(["policy"])
#   name        = var.iam_policy.name 
#   policy      = jsonencode({
#     Version = lookup(var.iam_role.policy, "Version", "2012-10-17")
#     Statement = [
#       {
#         Action = lookup(var.iam_role.policy, "Action", ["sts:AssumeRole"])
#         Effect = lookup(var.iam_role.policy, "Effect", "Allow")
#         Resource = lookup(var.iam_role.policy, "Resource", "*")
#       },
#     ]
#   })
#   # lookup(var.iam_policy, "policy")
#   description = lookup(var.iam_policy, "description")
#   path        = lookup(var.iam_policy, "path")
#   tags        = lookup(var.iam_policy, "tags ")

# }
resource "aws_iam_role_policy_attachment" "this" {
  for_each = var.policy_attachment
  policy_arn = each.value
  #lookup(var.policy_attachment,"policy_arn",var.create ? data.aws_iam_policy_document.this["document"].json : aws_iam_policy.this["policy"].arn)
  role       = aws_iam_role.this.name
}

