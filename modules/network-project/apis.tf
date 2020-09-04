// enable compute api so networking can be used in the project

resource "google_project_service" "compute" {
  project = "${google_project.network.number}"
  service = "compute.googleapis.com"
}
