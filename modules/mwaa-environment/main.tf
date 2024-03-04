resource "aws_mwaa_environment" "mwaa_env" {
  name                            = var.name
  execution_role_arn              = var.execution_role_arn
  source_bucket_arn               = var.source_bucket_arn
  dag_s3_path                     = var.dag_s3_path
  environment_class               = var.environment_class
  max_workers                     = var.max_workers
  min_workers                     = var.min_workers
  airflow_version                 = var.airflow_version
  kms_key                         = var.kms_key
  requirements_s3_path            = var.requirements_s3_path
  webserver_access_mode           = var.webserver_access_mode
  weekly_maintenance_window_start = var.weekly_maintenance_window_start
  plugins_s3_path                 = var.plugins_s3_path
  plugins_s3_object_version       = var.plugins_s3_object_version
  requirements_s3_object_version  = var.requirements_s3_object_version
  airflow_configuration_options   = var.airflow_configuration_options

  dynamic "network_configuration" {
    for_each = var.network_configuration
    content {
      security_group_ids = lookup(network_configuration.value, "security_group_ids", null)
      subnet_ids         = lookup(network_configuration.value, "subnet_ids", null)

    }
  }

  dynamic "logging_configuration" {
    for_each = var.logging_configuration
    content {
      dynamic "dag_processing_logs" {
        for_each = var.dag_processing_logs
        content {
          enabled                   = lookup(dag_processing_logs.value, "enabled", null)
          log_level                 = lookup(dag_processing_logs.value, "log_level", null)
          cloud_watch_log_group_arn = lookup(dag_processing_logs.value, "cloud_watch_log_group_arn", null)
        }
      }
      dynamic "scheduler_logs" {
        for_each = var.scheduler_logs
        content {
          enabled                   = lookup(scheduler_logs.value, "enabled", null)
          log_level                 = lookup(scheduler_logs.value, "log_level", null)
          cloud_watch_log_group_arn = lookup(scheduler_logs.value, "cloud_watch_log_group_arn", null)
        }
      }
      dynamic "task_logs" {
        for_each = var.task_logs
        content {
          enabled                   = lookup(task_logs.value, "enabled", null)
          log_level                 = lookup(task_logs.value, "log_level", null)
          cloud_watch_log_group_arn = lookup(task_logs.value, "cloud_watch_log_group_arn", null)
        }
      }
      dynamic "webserver_logs" {
        for_each = var.webserver_logs
        content {
          enabled                   = lookup(webserver_logs.value, "enabled", null)
          log_level                 = lookup(webserver_logs.value, "log_level", null)
          cloud_watch_log_group_arn = lookup(webserver_logs.value, "cloud_watch_log_group_arn", null)
        }
      }
      dynamic "worker_logs" {
        for_each = var.worker_logs
        content {
          enabled                   = lookup(worker_logs.value, "enabled", null)
          log_level                 = lookup(worker_logs.value, "log_level", null)
          cloud_watch_log_group_arn = lookup(worker_logs.value, "cloud_watch_log_group_arn", null)
        }
      }
    }
  }

  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )
}
