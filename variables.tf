variable "region" {
  default = ""
}

variable "appid" {
  default = ""
}
#cos
variable "bucket_name" {
  default = ""
}

variable "bucket_acl" {
  default = "private"
}

variable "lifecycle_rules" {
  type = list(object({
    filter_prefix = string
    expiration    = list(map(string))
    transition    = list(map(string))
  }))
  default = []
}

variable "cos_tags" {
  type    = map(string)
  default = {}
}
