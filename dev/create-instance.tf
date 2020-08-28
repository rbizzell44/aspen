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
    network = "google_compute_network.default.name"

    }

  }

