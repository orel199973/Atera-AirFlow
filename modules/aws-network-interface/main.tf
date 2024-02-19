resource "aws_network_interface" "this" {
  subnet_id               = var.subnet_id
  private_ips             = var.private_ips
  security_groups         = var.security_groups
  description             = var.description
#   interface_type          = var.interface_type
  ipv4_prefix_count       = var.ipv4_prefix_count
  ipv4_prefixes           = var.ipv4_prefixes
  tags                    = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
  dynamic "attachment" {
    for_each = var.attachment != null ? toset(["attachment"]) : toset([])
    content {
    instance     = var.attachment.instance
    device_index = var.attachment.device_index
    }

  }
}
