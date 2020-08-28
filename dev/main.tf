resource  "google_compute_instance" "default" {
  name         = "aspen-test"
  machine_type = "f1-micro"
  zone         = "us-east4-c"

  tags = ["aspen-test"]

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2019"
    }
  }


  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }


  network_interface {

    network = "aspen-vpc"

  }

}
