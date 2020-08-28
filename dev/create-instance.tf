resource  "google_compute_instance" "aspen-instance" {
  name = "aspen-test"
  machine_type = "f1-micro"
  zone = "us-east4-c"
  project = "cuit-terraform-project"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }

  network_interface {
    subnetwork = "google_compute_subnetwork.default.name"
    address    = "10.150.0.0/20"

    }

  }

