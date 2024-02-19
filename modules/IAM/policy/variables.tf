variable "name" {
  type = any
}
variable "create" {
  type = bool
  default = true
}
variable "statement" {
  type = any
  default = {}
}
variable "iam_role" {
  type = any
}
variable "iam_policy" {
  type = any
}
variable "policy_arn" {
  type = any
  default = null
}
variable "inline_policy" {
  type = any
  default = null
}
variable "create_policy" {
  type = bool
  default = false
}
