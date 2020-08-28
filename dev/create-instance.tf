resource  "google_compute_instance" "aspen-instance" {
  name = "aspen-test"
  machine_type = "f1-micro"
  zone = "us-east4-c"
  project = "cuit-terraform-project"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019-core "
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Include this section to give the VM an external ip address
    }

  }
}
