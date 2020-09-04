provider "google" {
  credentials = "${file("../../../../deployment/credentials_key.json")}"
}

provider "google-beta" {
  credentials = "${file("../../../../deployment/credentials_key.json")}"
}

terraform {
  backend "gcs" {
    bucket      = "admi-tf-admin-state-bucket"
    prefix      = "terraform/state/resources/shared-services-nprod/admi-ss-monitoring-nprod"
    credentials = "../../../../deployment/credentials_key.json"
  }
}
