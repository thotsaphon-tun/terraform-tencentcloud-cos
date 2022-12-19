locals {
  region = "app-guangzhou"
  bucket = "my-bucket-12345678"
}

resource "tencentcloud_cos_bucket" "cos" {
  source = "../../"

  bucket = local.bucket
  acl    = "private"
  
  cors_rules = [{
    allowed_origins = ["http://*.abc.com"]
    allowed_methods = ["PUT", "POST"]
    allowed_headers = ["*"]
    max_age_seconds = 300
    expose_headers  = ["Etag"]
  }]

  force_clean = true

  lifecycle_rules = [{
    filter_prefix = "path1/"

    transition {
      date          = "2019-06-01"
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 90
    }
  }]

  log_enable = "true"
  log_prefix = "MyLogPrefix"
  log_target_bucket = "mylog-12345678"

  multi_az = true
  
  origin_domain_rules = [{
    domain = "abc.example.com"
    type   = "REST"
    status = "ENABLE"
  }]

  origin_pull_rules = [{
    priority            = 1
    sync_back_to_source = false
    host                = "abc.example.com"
    prefix              = "/"
    protocol            = "FOLLOW" // "HTTP" "HTTPS"
    follow_query_string = true
    follow_redirection  = true
    follow_http_headers = ["origin", "host"]
    custom_http_headers = {
      "x-custom-header" = "custom_value"
    }
  }]

  replica_role      = "qcs::cam::uin/100000000001:uin/100000000001"

  replica_rules = [{
    id                 = "test-rep1"
    status             = "Enabled"
    prefix             = "dist"
    destination_bucket = "qcs::cos:%s::${tencentcloud_cos_bucket.replica1.bucket}"
  }]
  
  versioning_enable = true
  
  website = [{
    index_document = "index.html"
    error_document = "error.html"
  }]

  tags = {
    type = "test"
  }
}
