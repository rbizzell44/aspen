terraform {
  backend "gcs" {
    bucket = "aspen-benchmark-bucket"
    prefix = "create/instance"
  }
}
