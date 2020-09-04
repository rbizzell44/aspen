// project creation

resource "google_project" "network" {
  name            = "${var.project_name}"
  project_id      = "${var.project_name}"
  folder_id       = "${var.folder_id}"
  billing_account = "${var.billing_account}"
}
