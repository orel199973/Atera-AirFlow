
variable "name" {
  description = "The name of the IAM role"
  type        = string
}

variable "description" {
  description = "The description of the IAM role"
  type        = string
  default = ""
}

variable "managed_policy_arns" {
  description = "A list of ARNs for managed policies to attach to the IAM role"
  type        = list(string)
  default = []
}

variable "create" {
  description = "Flag to indicate whether to create the IAM role"
  type        = bool
  default     = false
}

variable "iam_role" {
  description = "IAM role configuration options"
  type        = any
  default     = null
}

variable "inline_policy" {
  description = "Inline policy configuration for the IAM role"
  type        = any
  default     = null
}