terraform {
  backend "gcs" {
    bucket = "cuit-terraform-project"
    prefix = "create/instance"
  }
}
