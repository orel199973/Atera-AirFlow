variable "name" {
  type        = string
  description = "The name of the S3 Bucket."
}
variable "bucket" {
  type    = string
  default = null
}
variable "bucket_prefix" {
  type    = any
  default = null
}
variable "force_destroy" {
  type    = any
  default = null
}
variable "object_lock_enabled" {
  type    = any
  default = null
}
variable "tags" {
  type        = map(string)
  description = "A map of additional tags to assign to the S3 Bucket."
  default     = {}
}
