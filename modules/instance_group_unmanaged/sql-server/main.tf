//
// Referencing Compute Image for instance group
//

//
// Instance Group Components
// 

resource "google_compute_instance_group" "default" {
  project   = "${var.project_id}"
  name      = "${var.name}-${var.environment}-${var.stack}"
  zone      = "${var.region}-${var.zone}"
  network   = data.google_compute_network.default-network.self_link
  instances = "${var.instance_list}"
}

data "google_compute_network" "default-network" {
  project = "${var.project_id}"
  name    = "default-network-${var.region}"
}