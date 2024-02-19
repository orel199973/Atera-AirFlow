output "id" {
  value = aws_route.this["route"].id
}
output "state" {
  value = aws_route.this["route"].state
}
output "instance_id" {
  value = aws_route.this["route"].instance_id
}
output "origin" {
  value = aws_route.this["route"].origin
}
output "route_table_id" {
  value = aws_route.this["route"].route_table_id
}
