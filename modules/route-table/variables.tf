variable "create" {
  type    = bool
  default = true
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the route table will be created"
}

variable "cidr_block" {
  type    = any
  default = null
}

variable "propagating_vgws" {
  type        = list(string)
  description = "The IDs of the virtual gateways to propagate routes to"
  default     = []
}

variable "route" {
  type    = any
  default = {}
}

variable "name" {
  type        = string
  description = "The name of the route table"
}

variable "tags" {
  type    = map(string)
  default = {}
}