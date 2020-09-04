resource "google_compute_subnetwork" "prod-network-for-l7lb" {
  provider = google-beta
  project = "admi-ss-nprod-svpc"
  name          = "nonprod-l7lb-cidr-usc1"
  ip_cidr_range = "10.129.19.0/24"
  region        = "us-central1"
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER" //PRIVATE
  role          = "ACTIVE"
  network       = "admi-ss-nprod-svpc-vpc"
}

//resource "google_compute_network" "custom-test" {
//  provider = google-beta
//
//  name                    = "l7lb-test-network"
//  auto_create_subnetworks = false
//}