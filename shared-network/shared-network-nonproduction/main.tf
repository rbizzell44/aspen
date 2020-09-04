/* ============================================
--  Non-Production Network
   ============================================ */

//
// Non-Production Network
//

// nonprod network resources
module "nonprod_network_resources" {
  source     = "../../../modules/vpc/"
  project_id = "${var.customer_identifier_prefix}-ss-nprod-svpc"
  subnets    = "${var.nonprod_subnets}"

  svpc_network_name = "svcp-network-allow-nprod"
  source_range_ip = [
    "10.129.24.0/21",
    "10.129.0.0/21",
    "10.131.24.0/21",
    "10.131.0.0/21",
    "10.129.16.0/26",
    "10.129.17.0/26",
    "10.129.18.0/26"
  ]
}

module "nonprod_network_nat" {
  source     = "../../../modules/nat/"
  project_id = "${var.customer_identifier_prefix}-ss-nprod-svpc"
  region     = "${var.region}"
  network    = "${module.nonprod_network_resources.vpc_name}"
}

module "nonprod_network_nat2" {
  source     = "../../../modules/nat/"
  project_id = "${var.customer_identifier_prefix}-ss-nprod-svpc"
  region     = "${var.region2}"
  network    = "${module.nonprod_network_resources.vpc_name}"
}

module "nonprod_ha_vpn" {
  source          = "../../../modules/vpn-nprod/"
  network_proj_id = "${var.customer_identifier_prefix}-ss-nprod-svpc"
}


// DNS Components

//module "nonprod_dns" {
//  project_name = "${var.customer_identifier_prefix}-ss-nprod-svpc"
//  source       = "../../../modules/dns"
//  zone_name    = "nprod-dns-zone"
//  dns_name     = "admi.com."
//  network_name = "admi-ss-nprod-svpc-vpc"
//}
