resource "aws_vpc_endpoint" "vpc_endpoint" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  auto_accept         = var.auto_accept
  private_dns_enabled = var.private_dns_enabled
  policy              = var.policy
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
  route_table_ids     = var.route_table_ids

  dynamic "dns_options" {
    for_each = var.dns_options
    content {
      dns_record_ip_type                             = lookup(dns_options.value, "dns_record_ip_type", null)
      private_dns_only_for_inbound_resolver_endpoint = lookup(dns_options.value, "private_dns_only_for_inbound_resolver_endpoint", null)
    }
  }
}
