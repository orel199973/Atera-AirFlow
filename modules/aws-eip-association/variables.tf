
variable "instance_id" {
  type        = string
  default = null
}

variable "allocation_id" {
  type        = string
  default = null
}

variable "allow_reassociation" {
  type        = bool
  default = true
}

variable "network_interface_id" {
  type        = string
  default = null
}

variable "private_ip_address" {
  type        = string
  default = null
}

variable "public_ip" {
  type        = string
  default     = null
}