resource  "google_compute_instance" "default" {
  name = "aspen-test"
  machine_type = "f1-micro"
  zone = "us-east1-c"
  project = "cuit-terraform-project"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }

  network_interface {

    network = "cuit-vpc-test"
    

  }
}