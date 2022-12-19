# COS bucket object

Creates COS bucket objects with different configurations.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.6 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >= 1.18.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >= 1.18.1 |

## Resources

| Name | Type |
|------|------|
| [tencentcloud_cos_bucket_object.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/cos_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create_bucket_object | Controls if COS bucket object should be created. | bool | true | no
| bucket_name | The name of the bucket. | string | "" | yes
| key | The name of the object once it is in the bucket. | string | "" | yes
| object_acl | Access control list for the bucket object. | string | private | no
| cache_control | Specifies caching behavior along the request/reply chain. For further details, RFC2616 can be referred. | string | "" | no
| content_disposition | Specifies presentational information for the object. | string | "" | no
| content_encoding | Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field. | string | "" | no
| content_type | A standard MIME type describing the format of the object data. | string | "" | no
| content | Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. | string | "" | no
| etag | The ETag generated for the object (an MD5 sum of the object content). | string | "" | no
| source | The path to the source file being uploaded to the bucket. | string | "" | no
| storage_class | Object storage type, Available values include STANDARD_IA, MAZ_STANDARD_IA, INTELLIGENT_TIERING, MAZ_INTELLIGENT_TIERING, ARCHIVE, DEEP_ARCHIVE. | string | "" | no
| tags | A mapping of tags to assign to the object. | map(string) | {} | no

## Outputs

| Name | Description |
|------|-------------|
|bucket_object_id|The ID of the object.|
