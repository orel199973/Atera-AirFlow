resource "aws_nat_gateway" "this" {
  allocation_id     = var.allocation_id
  subnet_id         = var.subnet_id
  connectivity_type = var.connectivity_type
  private_ip        = var.private_ip

  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
