output "bucket_id" {
  value = tencentcloud_cos_bucket.cos.*.id
}

output "bucket_url" {
  value = tencentcloud_cos_bucket.cos.*.cos_bucket_url
}

output "bucket_domain_certificate_id" {
  value = tencentcloud_cos_bucket_domain_certificate_attachment.cos_bucket_domain_certificate.*.id
}

output "bucket_policy_id" {
  value = tencentcloud_cos_bucket_policy.cos_policy.*.id
}
