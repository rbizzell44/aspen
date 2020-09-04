// router for nat

resource "google_compute_router" "nat" {
  name    = "nat"
  region  = "${var.region}"
  project = "${var.project_id}"
  network = "${var.network}"
}

// GOOGLE Cloud NAT

resource "google_compute_router_nat" "apps" {
  name                               = "${var.project_id}-nat"
  project                            = "${var.project_id}"
  router                             = "${google_compute_router.nat.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = "${google_compute_address.address.*.self_link}"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ALL"
  }
}

// using a static address for outbound nat.  Each address can facilitate 1008 instances
resource "google_compute_address" "address" {
  count   = 1
  name    = "nat-external-address-${count.index}"
  region  = "${var.region}"
  project = "${var.project_id}"
}
