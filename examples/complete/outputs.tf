output "bucket_id" {
  value = tencentcloud_cos_bucket.cos.*.id
}

output "bucket_url" {
  value = tencentcloud_cos_bucket.cos.*.cos_bucket_url
}
