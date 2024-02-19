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
