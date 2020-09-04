# GCP GCS Bucket

This module adds permission to a GCS bucket. 

## Variable Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket_name | Unique bucket name | string | n/a | yes| 
| bucket_member | service account email | string | n/a | yes|
| role | name of IAM role to apply to bucket | string | n/a | no |


## Example Usage
To be called in the main.tf file in the resources directory

```
module "gcs_bucket_p3_tddev_clinical_notes_IAM" {
  source      = "../../../../modules/storagebucket-policy"
  bucket_name = "${module.gcs_bucket_p3_tddev_clinical_notes.bucket_name}"
  bucket_member = "${var.tddev_docapi}"
//bucket_member = ["user:jane@example.com","serviceAccount:${module.gcp_service_account_web_ui.service_account_email"},]
  role        = "roles/storage.admin"
}
```