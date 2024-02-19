variable "name" {
  type    = string
}
variable "description" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
}
variable "ingress" {
  type    = any
}
variable "egress" {
  type    = any
}
variable "tags" {
  type    = map(string)
  default = {}
}


