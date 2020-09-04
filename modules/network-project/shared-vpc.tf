// enabling host vpc project

resource "google_compute_shared_vpc_host_project" "host_project" {
  project    = "${google_project.network.number}"
  depends_on = ["google_project_service.compute"]
}
