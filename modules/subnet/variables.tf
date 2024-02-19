variable "create" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the subnet will be created"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the subnet"
  default = null
}

variable "availability_zone_id" {
  type        = string
  description = "The ID of the availability zone"
  default = null
}
variable "assign_ipv6_address_on_creation" {
  type        = bool
  default = false
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
  default = null
}

variable "enable_dns64" {
  type    = bool
  default = false
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  type    = bool
  default = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  type    = bool
  default = false
}

variable "ipv6_cidr_block" {
  type        = string
  description = "The CIDR block for IPv6"
  default = null
}

variable "ipv6_native" {
  type    = bool
  default = false
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "private_dns_hostname_type_on_launch" {
  type        = string
  description = "The private DNS hostname type on launch"
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the subnet"
}

variable "tags" {
  type    = map(string)
  default = {}
}