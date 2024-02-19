
resource "aws_vpc" "this" {
  for_each = var.create ? toset(["vpc"]) : toset([])
  cidr_block          = var.cidr_block
  ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id
  ipv4_netmask_length = var.ipv4_netmask_length

  assign_generated_ipv6_cidr_block     = var.assign_generated_ipv6_cidr_block
  ipv6_cidr_block                      = var.ipv6_cidr_block
  ipv6_ipam_pool_id                    = var.ipv6_ipam_pool_id
  ipv6_netmask_length                  = var.ipv6_netmask_length
  ipv6_cidr_block_network_border_group = var.ipv6_cidr_block_network_border_group

  instance_tenancy                     = var.instance_tenancy
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_dns_support                   = var.enable_dns_support
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics

  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
    var.vpc_tags,
  )
}

# resource "aws_vpc_ipv4_cidr_block_association" "this" {
#   for_each            = var.create ? toset(["block_association"]) : toset([])
#   vpc_id              = aws_vpc.this["block_association"].id
#   cidr_block          = var.cidr_block
#   ipv4_ipam_pool_id   = var.ipv4_ipam_pool_id
#   ipv4_netmask_length = var.ipv4_ipam_pool_id != null ? var.ipv4_netmask_length : null
# }

# resource "aws_subnet" "this" {
#   for_each                                       = var.create ? toset(["subnet"]) : toset([])
#   vpc_id                                         = aws_vpc.this["subnet"].id
#   assign_ipv6_address_on_creation                = var.availability_zone
#   availability_zone                              = var.availability_zone
#   availability_zone_id                           = var.availability_zone_id
#   cidr_block                                     = var.cidr_block
#   enable_dns64                                   = var.enable_dns64
#   enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
#   enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
#   ipv6_cidr_block                                = var.ipv6_cidr_block
#   ipv6_native                                    = var.ipv6_native
#   map_public_ip_on_launch                        = var.map_public_ip_on_launch
#   private_dns_hostname_type_on_launch            = var.public_subnet_private_dns_hostname_type_on_launch
#   tags = merge(
#     {
#       Name = "${var.name}-subnet"
#     },
#     var.tags,
#   )
# }




# resource "aws_route_table_association" "this" {
#   for_each = var.create ? toset(["association"]) : toset([])
#   subnet_id      = aws_subnet.this["subnet"].id
#   route_table_id = aws_route_table.this["table"].id
# }

