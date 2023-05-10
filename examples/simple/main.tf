locals {
  region         = "ap-guangzhou"
  bucket         = "myftb"
  replica_bucket = "myftbr"
}

provider "tencentcloud" {
  region = local.region
}

data "tencentcloud_user_info" "this" {}

module "cos_bucket" {
  source = "../../"

  appid = data.tencentcloud_user_info.this.app_id
  bucket_name = "testcos1"

  versioning_enable = false
  #replica_role = ""
  #replica_rules = []


  #tags = local.common_tags
}
