resource  "google_compute_instance" "default" {
  name = "aspen-test"
  machine_type = "f1-micro"
  zone = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }

  network_interface {

    network = "gogole_computer_network.vpc_network.aspen-vpc"

  }

}
