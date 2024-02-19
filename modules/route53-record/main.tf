resource "aws_route53_record" "route53-record" {
  zone_id                          = var.zone_id
  name                             = var.name
  type                             = var.type
  ttl                              = var.ttl
  set_identifier                   = var.set_identifier
  records                          = var.records
  health_check_id                  = var.health_check_id
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
  allow_overwrite                  = var.allow_overwrite
  dynamic "weighted_routing_policy" {
    for_each = var.weighted_routing_policy
    content {
      weight = lookup(weighted_routing_policy.value, "weight", null)
    }
  }

  dynamic "alias" {
    for_each = var.alias
    content {
      name                   = lookup(alias.value, "name", null)
      zone_id                = lookup(alias.value, "zone_id", null)
      evaluate_target_health = lookup(alias.value, "evaluate_target_health", null)
    }
  }

  dynamic "cidr_routing_policy" {
    for_each = var.cidr_routing_policy
    content {
      collection_id = lookup(cidr_routing_policy.value, "collection_id", null)
      location_name = lookup(cidr_routing_policy.value, "location_name", null)
    }
  }

  dynamic "failover_routing_policy" {
    for_each = var.failover_routing_policy
    content {
      type = lookup(failover_routing_policy.value, "type", null)
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.geolocation_routing_policy
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent ", null)
      country     = lookup(geolocation_routing_policy.value, "country", null)
      subdivision = lookup(geolocation_routing_policy.value, "subdivision ", null)
    }
  }

  dynamic "latency_routing_policy" {
    for_each = var.latency_routing_policy
    content {
      region = lookup(latency_routing_policy.value, "region", null)
    }
  }
}
