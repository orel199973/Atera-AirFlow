output "name" {
  value = aws_route53_zone.route53_zone.name
}

output "zone_id" {
  value = aws_route53_zone.route53_zone.zone_id
}

output "name_servers" {
  value = aws_route53_zone.route53_zone.name_servers
}