variable "name" {
  type    = string
  default = null
}
variable "zone_id" {
  type    = any
  default = null
}
variable "type" {
  type    = string
  default = null
}
variable "ttl" {
  type    = number
  default = null
}
variable "set_identifier" {
  type    = string
  default = null
}
variable "records" {
  type    = any
  default = null

}
variable "multivalue_answer_routing_policy" {
  type    = any
  default = null
}
variable "health_check_id" {
  type    = any
  default = null
}
variable "allow_overwrite" {
  type    = any
  default = null
}
variable "alias" {
  type    = any
  default = {}
}
variable "cidr_routing_policy" {
  type    = any
  default = {}
}
variable "failover_routing_policy" {
  type    = any
  default = {}
}
variable "geolocation_routing_policy" {
  type    = any
  default = {}
}
variable "latency_routing_policy" {
  type    = any
  default = {}
}
variable "weighted_routing_policy" {
  type    = any
  default = {}
}

