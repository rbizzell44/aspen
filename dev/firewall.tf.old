resource "google_compute_firewall" "http-server" {
  name = "default-allow-http-terraform"
  network = "default"


  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}