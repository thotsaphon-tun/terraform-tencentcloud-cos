# Complete COS bucket with some of supported features enabled

Configuration in this directory creates COS bucket which demos such capabilities:
- static web-site hosting
- access logging
- replication
- versioning
- CORS
- lifecycle rules
- origin domain rules
- origin pull settings
- acl

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
