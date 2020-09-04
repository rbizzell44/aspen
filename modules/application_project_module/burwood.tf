
resource "google_project_service" "cloud_asset" {
  project = "${google_project.project.number}"
  service = "cloudasset.googleapis.com"
}
