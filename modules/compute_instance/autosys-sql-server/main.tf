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
  attached_disk { source = "${google_compute_disk.disk-3.self_link}" }
  attached_disk { source = "${google_compute_disk.disk-4.self_link}" }
  attached_disk { source = "${google_compute_disk.disk-5.self_link}" }
  attached_disk { source = "${google_compute_disk.disk-6.self_link}" }
}

resource "google_compute_disk" "disk-2" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_2}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_2}"
  labels  = "${var.labels}"
}

resource "google_compute_disk" "disk-3" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_3}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_3}"
  labels  = "${var.labels}"
}

resource "google_compute_disk" "disk-4" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_4}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_4}"
  labels  = "${var.labels}"
}

resource "google_compute_disk" "disk-5" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_5}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_5}"
  labels  = "${var.labels}"
}

resource "google_compute_disk" "disk-6" {
  project = "${var.project_id}"
  name    = "${var.env_initials}${var.app_initials}${var.stack_initials}-${var.disk_name_6}"
  type    = "${var.disk_type}"
  zone    = "${var.region}-${var.zone}"
  size    = "${var.disk_size_gb_6}"
  labels  = "${var.labels}"
}