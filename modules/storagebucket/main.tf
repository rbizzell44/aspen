// Create a GCS bucket

resource "google_storage_bucket" "gcs-bucket" {
  name          = "${var.bucket_name}"
  location      = "${var.location}"
  storage_class = "${var.storage_class}"
  project       = "${var.project_id}"
  force_destroy = "${var.force_destroy_property}"
  labels        = "${var.labels}"

  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = "${google_storage_bucket.gcs-bucket.name}"
}

resource "google_storage_bucket_iam_binding" "view_policy" {
  bucket  = "${google_storage_bucket.gcs-bucket.name}"
  role    = "${var.role}"
  members = ["serviceAccount:${var.sa_email}"]
}