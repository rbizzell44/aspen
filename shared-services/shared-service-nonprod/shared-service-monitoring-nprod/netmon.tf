resource "google_compute_instance" "q20centos01" {
  name         = "q20centos01"
  machine_type = "n1-standard-1"
  zone          = "${var.region}-a"
  project       = "${var.customer_identifier_prefix}${var.ProgID2}"
  allow_stopping_for_update = true
  metadata = {
    "ssh-keys" = <<EOT
        jmccann:${file("../../../../deployment/jmccann.ssh")}
        sgrimes:${file("../../../../deployment/sgrimes.ssh")}
        EOT
      //ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
      size  = 30
    }
  }
  network_interface {
    subnetwork = "nonprod-apps-cidr-usc1"
    subnetwork_project = "${var.customer_identifier_prefix}-ss-nprod-svpc"
  }
  tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "nonprod-ss"
    stack   = "testsystem"
    region  = "us-central1"
    department = "network"
    costcenter = "850"
  }

//  service_account {
//    email = "${module.gcp_service_account_play_time.service_account_email}"
//    scopes = ["compute-ro", "storage-full"]
//  }
}
resource "google_compute_instance" "q21centos02" {
  name         = "q21centos02"
  machine_type = "n1-standard-1"
  zone          = "${var.region2}-a"
  project       = "${var.customer_identifier_prefix}${var.ProgID2}"
  allow_stopping_for_update = true
  metadata = {
      "ssh-keys" = <<EOT
        jmccann:${file("../../../../deployment/jmccann.ssh")}
        sgrimes:${file("../../../../deployment/sgrimes.ssh")}
        EOT
   //ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"
      size  = 30
    }
  }
  network_interface {
    subnetwork = "nonprod-apps-cidr-use4"
    subnetwork_project = "${var.customer_identifier_prefix}-ss-nprod-svpc"
  }
  tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "nonprod-ss"
    stack   = "testsystem"
    region  = "us-east4"
    department = "network"
    costcenter = "850"
  }

  //  service_account {
  //    email = "${module.gcp_service_account_play_time.service_account_email}"
  //    scopes = ["compute-ro", "storage-full"]
  //  }
}