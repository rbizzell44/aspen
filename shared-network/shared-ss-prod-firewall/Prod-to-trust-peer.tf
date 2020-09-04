resource "google_compute_network_peering" "trust_peer_to_prod" {
  name         = "trust-peer-to-prod"
  network      = "${data.google_compute_network.trust-network.id}"
  peer_network = "${data.google_compute_network.prod-network.id}"
}

resource "google_compute_network_peering" "prod_to_trust_peer" {
  name         = "prod-to-trust-peer"
  network      = "${data.google_compute_network.prod-network.id}"
  peer_network = "${data.google_compute_network.trust-network.id}"
}

//$ terraform import google_compute_network_peering.peering_network project-name/network-name/peering-name

data "google_compute_network" "trust-network" {
  name = "trust-vpc"
  project = "admi-ss-prod-firewall"
}

data "google_compute_network" "prod-network" {
  name = "admi-ss-prod-svpc-vpc"
  project = "admi-ss-prod-svpc"
}

output "data1" {
  value = "${data.google_compute_network.prod-network.id}"
}
output "data2" {
  value = "${data.google_compute_network.trust-network.id}"
}