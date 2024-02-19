variable "create" {
  type    = bool
  default = true
}

variable "route_table_id" {
  type        = string
  description = "The ID of the route table where the route will be created"
}

variable "destination_cidr_block" {
  type        = string
  description = "The destination CIDR block for the route"
  default     = null
}

variable "destination_ipv6_cidr_block" {
  type        = string
  description = "The destination IPv6 CIDR block for the route"
  default     = null
}

variable "destination_prefix_list_id" {
  type        = string
  description = "The ID of the destination prefix list for the route"
  default     = null
}

variable "gateway_id" {
  type        = string
  description = "The ID of the gateway for the route"
  default     = null
}

variable "carrier_gateway_id" {
  type        = string
  description = "The ID of the carrier gateway for the route"
  default     = null
}

variable "core_network_arn" {
  type        = string
  description = "The ARN of the core network for the route"
  default     = null
}

variable "egress_only_gateway_id" {
  type        = string
  description = "The ID of the egress-only gateway for the route"
  default     = null
}

variable "nat_gateway_id" {
  type        = string
  description = "The ID of the NAT gateway for the route"
  default     = null
}

variable "local_gateway_id" {
  type        = string
  description = "The ID of the local gateway for the route"
  default     = null
}

variable "network_interface_id" {
  type        = string
  description = "The ID of the network interface for the route"
  default     = null
}

variable "transit_gateway_id" {
  type        = string
  description = "The ID of the transit gateway for the route"
  default     = null
}

variable "vpc_endpoint_id" {
  type        = string
  description = "The ID of the VPC endpoint for the route"
  default     = null
}

variable "vpc_peering_connection_id" {
  type        = string
  description = "The ID of the VPC peering connection for the route"
  default     = null
}
