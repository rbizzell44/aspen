 provider "google" {
   version = "~> 3.0"
 // credentials = "${file("../../../../deployment/credentials_key.json")}"
}

 provider "google-beta" {
   version = "~> 3.0"
 // credentials = "${file("../../../../deployment/credentials_key.json")}"
}

terraform {
  backend "gcs" {
    bucket      = "cuit-terraform-project"
    prefix      = "terraform/state/resources/epms-nonprod-dev-apptier"
//    credentials = "../../../../deployment/credentials_key.json"
  }
}
