resource "aws_route_table" "this" {
  for_each         = var.create ? toset(["table"]) : toset([])
  vpc_id           = var.vpc_id
  propagating_vgws = var.propagating_vgws

  dynamic "route" {
    for_each = var.route
    content {
      cidr_block                = lookup(route.value, "egress_only_gateway_id", var.cidr_block)
      egress_only_gateway_id    = lookup(route.value, "egress_only_gateway_id", null)
      gateway_id                = lookup(route.value, "gateway_id", null)
      ipv6_cidr_block           = lookup(route.value, "ipv6_cidr_block", null)
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
      local_gateway_id          = lookup(route.value, "local_gateway_id", null)
      carrier_gateway_id        = lookup(route.value, "carrier_gateway_id", null)
    }
  }

  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
