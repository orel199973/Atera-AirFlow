resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", 443)
      to_port          = lookup(ingress.value, "to_port", 22)
      protocol         = lookup(ingress.value, "protocol", "tcp")
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", [])
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", [])
      security_groups  = lookup(ingress.value, "security_groups", [])
      self             = lookup(ingress.value, "self", false)
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      description      = lookup(egress.value, "description", null)
      from_port        = lookup(egress.value, "from_port", 0)
      to_port          = lookup(egress.value, "to_port", 0)
      protocol         = lookup(egress.value, "protocol", "tcp")
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", [])
      cidr_blocks      = lookup(egress.value, "cidr_blocks", [])
      security_groups  = lookup(egress.value, "security_groups", [])
      self             = lookup(egress.value, "self", false)
    }

  }

  tags = merge(
    { "Name" = "${var.name}" },
  var.tags, )
}
