/// Organization Policies
resource "google_folder_organization_policy" "allow_public_ip_vm" {
  constraint = "constraints/compute.vmExternalIpAccess"
  folder     = "${var.folder_id}"

  list_policy {
    allow {
      all = "${var.allow_public_ip_vm}"
    }
  }
}

