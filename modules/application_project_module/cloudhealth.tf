//Additional API To Add for Cloud Health

resource "google_project_service" "cloud_billing" {
  project = "${google_project.project.number}"
  service = "cloudbilling.googleapis.com"
}

resource "google_project_service" "storage-api-json" {
  project = "${google_project.project.number}"
  service = "storage-api.googleapis.com"
}

resource "google_project_service" "storage-api" {
  project = "${google_project.project.number}"
  service = "storage-component.googleapis.com"
}

resource "google_project_service" "resourcemanager-api" {
  project = "${google_project.project.number}"
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "bigquery-api" {
  project = "${google_project.project.number}"
  service = "bigquery.googleapis.com"
}
resource "google_project_service" "recommender-api" {
  project = "${google_project.project.number}"
  service = "recommender.googleapis.com"
}