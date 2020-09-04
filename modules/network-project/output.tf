output "host_project_id" {
  value = "${google_project.network.number}"
}
output "project_id" {
  value = "${google_project.network.project_id}"
}