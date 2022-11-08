output "bucket_prefix" {
  value = tencentcloud_cos_bucket.cos.*.bucket
}
