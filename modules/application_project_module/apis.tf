###
### Default APIs to be enabled when a project is created.
###

resource "google_project_service" "cloud_api" {
  project = "${google_project.project.number}"
  service = "cloudapis.googleapis.com"
}

resource "google_project_service" "compute" {
  project                    = "${google_project.project.number}"
  service                    = "compute.googleapis.com"
  disable_dependent_services = true
}