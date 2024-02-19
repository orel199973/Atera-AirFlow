output "public_ip" {
  value = aws_eip_association.this.public_ip 
}
output "private_ip_address" {
  value = aws_eip_association.this.private_ip_address
}
output "network_interface_id" {
  value = aws_eip_association.this.network_interface_id 
}
output "instance_id " {
  value = aws_eip_association.this.id
}
output "allocation_id" {
  value = aws_eip_association.this.id
}
