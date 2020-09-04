# GCP DNS Zone Resource

This resource creates a managed DNS zone and zone records.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dns\_name | Domain name for zone record | string | n/a | yes |
| zone\_name | Name for the DNS zone resource | string | n/a | yes |
| zone\_records | Subdomain records for domain in map format| map | n/a | yes |

## Example Usage
```
module "dns_zone" {
  source                     = "../../../modules/dns/"
  project_id                 = "${var.project_id}"
  zone_name                  = "${var.zone_name}"
  dns_name                   = "${var.dns_name}"
  zone_records               = "${var.zone_records}"
}
```
