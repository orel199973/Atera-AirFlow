resource "aws_eip_association" "this" {
  instance_id          = var.instance_id
  allocation_id        = var.allocation_id
  allow_reassociation  = var.allow_reassociation
  network_interface_id = var.network_interface_id
  private_ip_address   = var.private_ip_address
  public_ip            = var.public_ip
}
