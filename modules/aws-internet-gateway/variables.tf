variable "vpc_id" {
  type = any
}
variable "name" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
