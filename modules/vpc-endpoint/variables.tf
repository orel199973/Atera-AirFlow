variable "vpc_id" {
  type    = any
  default = null
}

variable "service_name" {
  type    = any
  default = null
}


variable "vpc_endpoint_type" {
  type    = any
  default = null
}


variable "auto_accept" {
  type    = any
  default = null
}


variable "private_dns_enabled" {
  type    = any
  default = null
}


variable "policy" {
  type    = any
  default = null
}


variable "subnet_ids" {
  type    = any
  default = null
}

variable "security_group_ids" {
  type    = any
  default = null
}

variable "route_table_ids" {
  type    = any
  default = null
}

variable "dns_options" {
  type    = any
  default = {}
}
