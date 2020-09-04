// create network

resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  project                 = "${var.project_id}"
  description             = "vpc to be used by other projects in the account"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

locals {
  subnet_keys = "${keys(var.subnets)}"
}

// create subnets for the network from the list provided

resource "google_compute_subnetwork" "vpc_subnets" {
  count         = "${length(local.subnet_keys)}"
  project       = "${var.project_id}"
  name          = "${lookup(var.subnets[local.subnet_keys[count.index]], "name")}"
  description   = "Subnet: ${lookup(var.subnets[local.subnet_keys[count.index]], "name")}"
  ip_cidr_range = "${lookup(var.subnets[local.subnet_keys[count.index]], "ip_cidr_range")}"
  region        = "${lookup(var.subnets[local.subnet_keys[count.index]], "region")}"
  network       = "${google_compute_network.vpc.self_link}"
  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}
