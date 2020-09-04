// create folder log sink

resource "google_logging_folder_sink" "folder_sink" {
  name   = "${var.folder_sink_name}"
  folder = "${google_folder.default.name}"

  destination = "storage.googleapis.com/${google_storage_bucket.folder_log_bucket.name}"

  filter           = "severity >= ${var.severity_level}"
  include_children = "true"
}

// create storage bucket to send logs too
resource "google_storage_bucket" "folder_log_bucket" {
  name          = "${var.audit_bucket_name}"
  project       = "${var.project_id}"
  location      = "${var.log_bucket_location}"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = "90"
    }
  }
}

// give required permissions to the sink service account
resource "google_project_iam_member" "object_creator_member" {
  project = "${var.project_id}"
  role    = "roles/storage.objectCreator"
  member  = "${google_logging_folder_sink.folder_sink.writer_identity}"
}
