# GCP Service Account

This module allows creation of a GCP Service Account. 

## Variable Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| source | location of module | string | n/a | yes |
| sa_display_name | name of service account | string | n/a | yes |
| account_id | account id is used to generate service account email address and a stable unique id | string | n/a | yes | 
| project_id | project name | string | n/a | yes |


## Example Usage
To be called in the main.tf file in the resources directory

```
module "gcp_service_account_web_ui" {
  source          = "../../../../modules/serviceaccount"
  sa_display_name = "Test Service Account - Web UI"
  account_id      = "admi-cr-qa-1-test-web-ui"
  project_id      = "${var.customer_identifier_prefix}-cr-qa-1-test"
}
```