variable "create" {
  type    = bool
  default = true
}
variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = null
}
variable "vpc_id" {
  type        = string
  default     = null
}

variable "ipv4_ipam_pool_id" {
  type        = string
  description = "The ID of the IPv4 IPAM pool"
  default     = null
}

variable "ipv4_netmask_length" {
  type        = number
  description = "The netmask length for the IPv4 CIDR block"
  default     = null
}

variable "assign_generated_ipv6_cidr_block" {
  type    = bool
  default = false
}

variable "ipv6_cidr_block" {
  type        = string
  description = "The CIDR block for IPv6"
  default     = null
}

variable "ipv6_ipam_pool_id" {
  type        = string
  description = "The ID of the IPv6 IPAM pool"
  default     = null
}

variable "ipv6_netmask_length" {
  type        = number
  description = "The netmask length for the IPv6 CIDR block"
  default     = null
}

variable "ipv6_cidr_block_network_border_group" {
  type        = string
  description = "The network border group for the IPv6 CIDR block"
  default     = null
}

variable "instance_tenancy" {
  type        = string
  description = "The tenancy of instances launched into the VPC"
  default     = "default"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = false
}

variable "enable_dns_support" {
  type    = bool
  default = true
}


variable "enable_network_address_usage_metrics" {
  type    = bool
  default = false
}

variable "name" {
  type        = string
  description = "The name of the VPC"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_tags" {
  type    = map(string)
  default = {}
}
