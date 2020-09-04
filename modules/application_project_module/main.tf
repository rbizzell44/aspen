##
## Project creation
##

resource "google_project" "project" {
  name            = "${var.project_id}"
  project_id      = "${var.project_id}"
  folder_id       = "${var.folder_id}"
  billing_account = "${var.billing_account_id}"

  provisioner "local-exec" {
    command = "sleep 300"
  }
}

##
## Project binding to host Shared VPC project
##

resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = "${var.host_project_id}"
  service_project = "${google_project.project.number}"
  depends_on      = ["google_project_service.compute"]
}

##
##  IAM binding to shared VPC
##

resource "google_project_iam_member" "sharedvpc-project-iam" {
  project    = "${var.host_project_id}"
  role       = "roles/compute.networkUser"
  member     = "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com"
  depends_on = ["google_project_service.compute"]
}
