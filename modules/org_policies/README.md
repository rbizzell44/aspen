# GCP Organizational Policy Module

This module allows enforcement of organization policies

## Variable Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| disable\_default\_network | Set true to disable creation of default network and associated resources | string | `"false"` | no |
| disable\_service\_account\_creation | Set true to disable creation of service accounts | string | `"false"` | no |
| disable\_service\_account\_key\_creation | Set true to disable creation of service account keys | string | `"false"` | no |
| org\_id | Organization ID | string | n/a | yes |
| require\_shielded\_vms | Set true to require shielded VMs in GCE | string | `"false"` | no |
| restrict\_lien\_removal | Set true to restrict the set of users who can remove a Shared VPC project lien | string | `"false"` | no |

## Example Usage
```
module "org_policies" {
  source                  = "../../modules/org_policies/"
  org_id                  = "${var.org_id}"
  disable_default_network = true
  restrict_lien_removal   = true
}
```
