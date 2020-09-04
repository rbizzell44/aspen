//
// Compute Instance Components
//

resource "google_compute_instance" "default" {
  project      = "${var.project_id}"
  name         = "${var.env_initials}${var.app_initials}${var.stack_initials}"
  zone         = "${var.region}-${var.zone}"
  machine_type = "${var.machine_type}"
  tags         = "${var.target_tags}"
  labels       = "${var.labels}"

  boot_disk {
    initialize_params {
      image = "${var.compute_image}"
      size  = "${var.boot_disk_size}"
    }
  }

  network_interface {
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${var.subnetwork_project}"
  }

  metadata = var.metadata

  service_account {
    email  = "${var.service_account_email}"
    scopes = ["${var.api_scopes}"]
  }

  // Disks
  attached_disk { source = "${google_compute_disk.disk-2.self_link}" }
}

resource "google_compute_disk" "disk-2" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_2}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_2}"
  labels  = "${var.labels}"
}