variable "create_bucket_object" {
  description = "Controls if COS bucket object should be created."
  type = bool
  default = true
}

variable "bucket_name" {
  description = "The name of the bucket."
  type = "string"  
  default = ""
}

variable "key" {
  description = "The name of the object once it is in the bucket."
  type = "string"  
  default = ""
}

variable "object_acl" {
  description = "Access control list for the bucket object."
  type = string
  default = "private"
}

variable "cache_control" {
  description = "Specifies caching behavior along the request/reply chain. For further details, RFC2616 can be referred."
  type = string
  default = ""
}

variable "content_disposition" {
  description = "Specifies presentational information for the object."
  type = string
  default = ""
}

variable "content_encoding" {
  description = "Specifies what content encodings have been applied to the object and thus what decoding mechanisms must be applied to obtain the media-type referenced by the Content-Type header field."
  type = string
  default = ""
}

variable "content_type" {
  description = "A standard MIME type describing the format of the object data."
  type = string
  default = ""
}

variable "content" {
  description = "Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text."
  type = string
  default = ""
}

variable "etag" {
  description = "The ETag generated for the object (an MD5 sum of the object content)."
  type = string
  default = ""
}

variable "source" {
  description = "The path to the source file being uploaded to the bucket."
  type = string
  default = ""
}

variable "storage_class" {
  description = "Object storage type, Available values include STANDARD_IA, MAZ_STANDARD_IA, INTELLIGENT_TIERING, MAZ_INTELLIGENT_TIERING, ARCHIVE, DEEP_ARCHIVE."
  type = string
  default = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the object."
  type    = map(string)
  default = {}
}
