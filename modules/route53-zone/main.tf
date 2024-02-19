resource "aws_route53_zone" "route53_zone" {
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy
  tags              = var.tags

  #   dynamic "vpc" {
  #     for_each = var.vpc
  #     content {
  #       vpc_id     = lookup(vpc.value, "vpc_id", null)
  #       vpc_region = lookup(vpc.value, "vpc_region", null)

  #     }
  #   }
}