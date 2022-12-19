output "bucket_object_id" {
  value = tencentcloud_cos_bucket_object.cos_object.*.id
}
