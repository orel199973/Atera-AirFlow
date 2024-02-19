resource "aws_s3_bucket" "s3" {
  bucket              = var.bucket
  bucket_prefix       = var.bucket_prefix
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled

  tags = merge(
    { "Name" = "${var.name}" },
    var.tags,
  )

}
