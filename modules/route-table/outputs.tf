output "id" {
  value = aws_route_table.this["table"].id
}
output "arn" {
  value = aws_route_table.this["table"].arn
}
output "vpc_id" {
  value = aws_route_table.this["table"].vpc_id
}
output "tags_all" {
  value = aws_route_table.this["table"].tags_all
}
output "propagating_vgws" {
  value = aws_route_table.this["table"].propagating_vgws
}
