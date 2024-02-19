variable "subnet_id" {
  type = string
}
variable "name" {
  type = string
}

variable "private_ips" {
  type = list(string)
  default = []
}

variable "security_groups" {
  type = any
  default = null
}

variable "description" {
  type = string
  default = null
}

# variable "interface_type" {
#   type = string
# }

variable "ipv4_prefix_count" {
  type = number
  default = null
}

variable "ipv4_prefixes" {
  type = list(string)
  default = null
}



variable "tags" {
  type = map(string)
  default = {}
}

variable "attachment" {
  type = any
  default = null
}