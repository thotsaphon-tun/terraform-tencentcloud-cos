resource "tencentcloud_cos_bucket_object" "cos_object" {
  count = var.create_bucket_object ? 1 : 0

  bucket = var.bucket_name
  key = var.key
  acl    = var.object_acl

  cache_control = var.cache_control
  content_disposition = var.content_disposition
  content_encoding = var.content_encoding
  content_type = var.content_type
  content = var.content 

  etag = var.etag
  source = var.source_path
  storage_class = var.storage_class 
 
  tags = var.tags
}
