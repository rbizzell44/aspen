# GCP Organizational Policy Module (Optional - For Projects)

This module allows enforcement of organization policies on a project level.

## Variable Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| org\_id | Organization ID | string | n/a | yes |
| allow\_public\_ip\_vm | Set true to allow Compute Engine VM instances to use external IP addresses | string | `"false"` | yes |

## Example Usage
```
module "org_policies" {
  source                  = "../../modules/org_policies/"
  org_id                  = "${var.org_id}"
  disable_default_network = true
  restrict_lien_removal   = true
}
```
