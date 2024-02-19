output "id" {
  value = aws_subnet.this["subnet"].id
}
output "arn" {
  value = aws_subnet.this["subnet"].arn
}
output "ipv6_cidr_block_association_id" {
  value = aws_subnet.this["subnet"].ipv6_cidr_block_association_id
}
output "tags_all" {
  value = aws_subnet.this["subnet"].tags_all
}
