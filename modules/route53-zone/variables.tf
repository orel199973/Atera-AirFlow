variable "name" {
  type    = string
  default = null
}

variable "comment" {
  type    = string
  default = null
}

variable "delegation_set_id" {
  type    = string
  default = null
}

variable "force_destroy" {
  type    = string
  default = null
}


variable "tags" {
  type    = map(string)
  default = {}
}

# variable "vpc" {
#   type        = any
#   default     = [{}]
# }