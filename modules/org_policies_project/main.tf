/// Organization Policies
resource "google_project_organization_policy" "allow_public_ip_vm" {
  constraint = "constraints/compute.vmExternalIpAccess"
  project    = "${var.project_id}"

  list_policy {
    allow {
      all = "${var.allow_public_ip_vm}"
    }
  }
}

