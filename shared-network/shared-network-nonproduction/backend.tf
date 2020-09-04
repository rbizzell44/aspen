provider "google" {
  credentials = "${file("../../../deployment/credentials_key.json")}"
}

provider "google-beta" {
  credentials = "${file("../../../deployment/credentials_key.json")}"
}

terraform {
  backend "gcs" {
    bucket      = "cuit-terraform-project"
    prefix      = "terraform/state/resources/network/nonprod"

  }
}
