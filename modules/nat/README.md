### Usage

Generate a NAT gateway for a network

by default this Nat can host up to ~1000 connections.  To scale, increase the count of external IPs that are deployed for the NAT resource.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| network |  | string | n/a | yes |
| project\_id |  | string | n/a | yes |
| region |  | string | n/a | yes |


## Example Usage
```
module "network_nat" {
  source     = "../../../modules/nat/"
  project_id = "${var.customer_identifier_prefix}-network-nonprod"
  region     = "${var.region}"
  network    = "${module.nonprod_netowkr_resources.vpc_name}"
}
```
