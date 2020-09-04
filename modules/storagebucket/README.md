# GCP GCS Bucket

This module allows creation of a GCS bucket. 

## Variable Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| source | location of storagebucket module | string | n/a | yes |
| location | Where bucket hosts data | string | us-central1 | yes |
| bucket_name | Unique bucket name | string | n/a | yes| 
| project_id | Name of project | string | n/a | yes |
| sa_email | service account email | string | n/a | no |
| role | name of IAM role to apply to bucket | string | n/a | no |


## Example Usage
To be called in the main.tf file in the resources directory

```
module "gcs_bucket_web_ui" {
  source      = "../../../../modules/storagebucket"
  location    = "${var.region}"
  bucket_name = "${var.bu_prefix}-web-ui-nonprod"
  project_id  = "${var.customer_identifier_prefix}-cr-qa-1-test"
  sa_email    = "${module.gcp_service_account_web_ui.service_account_email}"
  role        = "roles/storage.objectViewer"
}
```