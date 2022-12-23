locals {
  bucket = "${var.bucket_name}-${var.appid}"
}

resource "tencentcloud_cos_bucket" "cos" {
  count = var.create_bucket ? 1 : 0

  bucket   = local.bucket
  acl      = var.bucket_acl
  acl_body = var.acl_body

  dynamic "cors_rules" {
    for_each = var.cors_rules
    content {
      allowed_headers = lookup(cors_rules.value, "allowed_headers", [])
      allowed_methods = lookup(cors_rules.value, "allowed_methods", [])
      allowed_origins = lookup(cors_rules.value, "allowed_origins", [])
      expose_headers  = lookup(cors_rules.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rules.value, "max_age_seconds", null)
    }
  }

  encryption_algorithm = var.encryption_algorithm
  force_clean          = var.force_clean

  dynamic "lifecycle_rules" {
    for_each = var.lifecycle_rules
    content {
      filter_prefix = lookup(lifecycle_rules.value, "filter_prefix", "")

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

  log_enable        = var.log_enable
  log_prefix        = var.log_prefix
  log_target_bucket = var.log_target_bucket

  multi_az = var.multi_az

  dynamic "origin_domain_rules" {
    for_each = var.origin_domain_rules
    content {
      domain = lookup(origin_domain_rules.value, "domain", "")
      status = lookup(origin_domain_rules.value, "status", "ENABLED")
      type   = lookup(origin_domain_rules.value, "type", "REST")
    }
  }

  dynamic "origin_pull_rules" {
    for_each = var.origin_pull_rules
    content {
      host                = lookup(origin_pull_rules.value, "host", "")
      priority            = lookup(origin_pull_rules.value, "priority", 0)
      custom_http_headers = lookup(origin_pull_rules.value, "custom_http_headers", null)
      follow_http_headers = lookup(origin_pull_rules.value, "follow_http_headers", null)
      follow_query_string = lookup(origin_pull_rules.value, "follow_query_string", false)
      follow_redirection  = lookup(origin_pull_rules.value, "follow_redirection", false)
      prefix              = lookup(origin_pull_rules.value, "prefix", null)
      protocol            = lookup(origin_pull_rules.value, "protocol", null)
      sync_back_to_source = lookup(origin_pull_rules.value, "sync_back_to_source", false)
    }
  }

  replica_role = var.replica_role

  dynamic "replica_rules" {
    for_each = var.replica_rules
    content {
      destination_bucket        = lookup(replica_rules.value, "destination_bucket", "")
      status                    = lookup(replica_rules.value, "status", "")
      destination_storage_class = lookup(replica_rules.value, "destination_storage_class", null)
      id                        = lookup(replica_rules.value, "id", null)
      prefix                    = lookup(replica_rules.value, "prefix", null)
    }
  }

  versioning_enable = var.versioning_enable

  dynamic "website" {
    for_each = var.website
    content {
      error_document = lookup(website.value, "error_document", null)
      index_document = lookup(website.value, "index_document", null)
    }
  }

  tags = var.tags
}


resource "tencentcloud_cos_bucket_domain_certificate_attachment" "cos_bucket_domain_certificate" {
  count = var.create_bucket_domain_certificate ? 1 : 0

  bucket = local.bucket

  dynamic "domain_certificate" {
    for_each = var.domain_certificate
    content {
      domain = lookup(domain_certificate.value, "domain", "")

      dynamic "certificate" {
        for_each = lookup(domain_certificate.value, "certificate", [])
        content {
          cert_type = lookup(certificate.value, "cert_type", "")

          dynamic "custom_cert" {
            for_each = lookup(certificate.value, "custom_cert", [])
            content {
              cert        = lookup(custom_cert.value, "cert", "")
              private_key = lookup(custom_cert.value, "private_key", "")
            }
          }
        }
      }
    }
  }
}


resource "tencentcloud_cos_bucket_policy" "cos_policy" {
  count = var.create_bucket_policy ? 1 : 0

  bucket = local.bucket
  policy = var.policy
}
