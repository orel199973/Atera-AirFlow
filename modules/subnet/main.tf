resource "aws_subnet" "this" {
  for_each                                       = var.create ? toset(["subnet"]) : toset([])
  vpc_id                                         = var.vpc_id
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  availability_zone                              = var.availability_zone
  availability_zone_id                           = var.availability_zone_id
  cidr_block                                     = var.cidr_block
  enable_dns64                                   = var.enable_dns64
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = var.ipv6_cidr_block
  ipv6_native                                    = var.ipv6_native
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch
  tags = merge(
    {
      Name = "${var.name}"
    },
    var.tags,
  )
}