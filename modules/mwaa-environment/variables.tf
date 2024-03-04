variable "name" {
  type    = any
  default = null
}

variable "execution_role_arn" {
  type    = any
  default = null
}

variable "source_bucket_arn" {
  type    = any
  default = null
}

variable "dag_s3_path" {
  type    = any
  default = null
}

variable "environment_class" {
  type    = any
  default = null
}

variable "max_workers" {
  type    = any
  default = null
}

variable "min_workers" {
  type    = any
  default = null
}

variable "airflow_version" {
  type    = any
  default = null
}

variable "kms_key" {
  type    = any
  default = null
}

variable "webserver_access_mode" {
  type    = any
  default = null
}

variable "weekly_maintenance_window_start" {
  type    = any
  default = null
}

variable "plugins_s3_path" {
  type    = any
  default = null
}

variable "plugins_s3_object_version" {
  type    = any
  default = null
}

variable "requirements_s3_path" {
  type    = any
  default = null
}

variable "requirements_s3_object_version" {
  type    = any
  default = null
}




variable "network_configuration" {
  type    = any
  default = {}
}

variable "logging_configuration" {
  type    = any
  default = {}
}

variable "airflow_configuration_options" {
  type    = any
  default = {}
}

variable "dag_processing_logs" {
  type    = any
  default = {}
}

variable "scheduler_logs" {
  type    = any
  default = {}
}

variable "task_logs" {
  type    = any
  default = {}
}

variable "webserver_logs" {
  type    = any
  default = {}
}

variable "worker_logs" {
  type    = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
