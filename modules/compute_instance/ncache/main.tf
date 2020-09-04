//
// Compute Instance Components
//

resource "google_compute_instance" "default" {
  project      = var.project_id
  name         = "${var.env_initials}${var.app_initials}${var.stack_initials}"
  zone         = var.zone
  region       = var.region
  machine_type = var.machine_type
  tags         = var.target_tags
  labels       = var.labels
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.compute_image
      size  = var.boot_disk_size
      type =  var.disk_type
    }
  }

  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
    network_ip = var.ip_address
  }

  metadata = var.metadata

  service_account {
    email  = var.service_account_email
    scopes = var.api_scopes
  }
}