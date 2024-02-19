output "id" {
  value = aws_vpc.this["vpc"].id
}
output "arn" {
  value = aws_vpc.this["vpc"].arn
}
output "instance_tenancy" {
  value = aws_vpc.this["vpc"].instance_tenancy
}
output "enable_dns_support" {
  value = aws_vpc.this["vpc"].enable_dns_support
}
output "enable_network_address_usage_metrics" {
  value = aws_vpc.this["vpc"].enable_network_address_usage_metrics
}
output "enable_dns_hostnames" {
  value = aws_vpc.this["vpc"].enable_dns_hostnames
}
output "main_route_table_id" {
  value = aws_vpc.this["vpc"].main_route_table_id 
}
output "default_network_acl_id" {
  value = aws_vpc.this["vpc"].default_network_acl_id
}
output "default_security_group_id" {
   value = aws_vpc.this["vpc"].default_security_group_id
}