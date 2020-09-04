// Create a GCS bucket

resource "google_storage_bucket_iam_binding" "bucket_user" {
    bucket  = "${var.bucket_name}"
    role    = "${var.role}"
    members = "${var.bucket_member}"
}

