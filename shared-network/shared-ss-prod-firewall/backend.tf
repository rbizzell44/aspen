provider "google" {
  credentials = "${file("../../../deployment/credentials_key.json")}"
    project     = var.project_id
    region      = var.regions[0]
}

//provider "google-beta" {
//  credentials = "${file("../../../deployment/credentials_key.json")}"
//    project     = var.project_id
//    region      = var.regions[0]
//}

terraform {
  backend "gcs" {
    bucket      = "admi-tf-admin-state-bucket"
    prefix      = "terraform/state/resources/network/admi-ss-prod-firewall"
    credentials = "../../../deployment/credentials_key.json"
  }
}

terraform {
  required_version = ">= 0.12"
}

//provider "google" {
//  credentials = "${file("../../../deployment/credentials_key.json")}"
//  project     = var.project_id
//  region      = var.regions[0]
//}

provider "google-beta" {
  credentials = "${file("../../../deployment/credentials_key.json")}"
  project     = var.project_id
  region      = var.regions[0]
  version     = "> 3.0.0"
}

data "google_compute_zones" "available" {}
output "result_list" {
  value = "${data.google_compute_zones.available.names}"
}