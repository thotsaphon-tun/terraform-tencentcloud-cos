output "bucket_object_id" {
  value = concat(tencentcloud_cos_bucket_object.cos_object.*.id, [""])[0]
}
