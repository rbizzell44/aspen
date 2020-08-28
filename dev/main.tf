resource "google_compute_instance" "default" {
  name = "test"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"
  project = "cuit-terraform-project"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "aspen-vpc"

    access_config {
      // Ephemeral IP
    }
  }
}