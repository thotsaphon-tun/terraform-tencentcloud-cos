provider "tencentcloud" {
  region = var.region
}


resource "tencentcloud_cos_bucket" "cos" {
  bucket = "${var.bucket_name}-${var.appid}"
  acl    = var.bucket_acl

  dynamic "lifecycle_rules" {
    for_each = var.lifecycle_rules
    content {
      filter_prefix = lifecycle_rules.value.filter_prefix

      dynamic "expiration" {
        for_each = lookup(lifecycle_rules.value, "expiration", [])
        content {
          date = lookup(expiration.value, "date", null)
          days = lookup(expiration.value, "days", null)
        }
      }

      dynamic "transition" {
        for_each = lookup(lifecycle_rules.value, "transition", [])
        content {
          storage_class = lookup(transition.value, "storage_class", null)
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
        }
      }
    }
  }

  tags = var.cos_tags
}
