
resource "aws_iam_role" "this" {
  name                = var.name
  description         = var.description
  managed_policy_arns = var.managed_policy_arns
  assume_role_policy  = var.create ? data.aws_iam_policy_document.this["document"].json : jsonencode({
    Version = lookup(var.iam_role.assume_role_policy, "Version", "2012-10-17")
    Statement = [
      {
        Action = lookup(var.assume_role_policy, "Action", "sts:AssumeRole")
        Effect = lookup(var.assume_role_policy, "Effect", "Allow")
        Sid    = lookup(var.assume_role_policy, "Sid", "")
        Principal = {
          Service = var.assume_role_policy.Principal.Service #"ec2.amazonaws.com"
        }
      },
    ]
  })
  dynamic "inline_policy" {
    for_each = var.inline_policy != null ? toset(["inline_policy"]) : toset([])
    content {
        name = inline_policy.value.name
        policy = inline_policy.value.policy
    }
  }      
}
