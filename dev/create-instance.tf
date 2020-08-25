resource  "google_compute_instance" "default" {
  name = "virtual-machine-from-terraform"
  machine_type = "f1-micro"
  zone = "us-east4-c"

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
