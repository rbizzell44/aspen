/// Organization Policies
resource "google_organization_policy" "disable_default_network" {
  count      = "${var.disable_default_network ? 1 : 0}"
  org_id     = "${var.org_id}"
  constraint = "compute.skipDefaultNetworkCreation"

  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "restrict_lien_removal" {
  count      = "${var.restrict_lien_removal ? 1 : 0}"
  org_id     = "${var.org_id}"
  constraint = "constraints/compute.restrictXpnProjectLienRemoval"

  boolean_policy {
    enforced = true
  }
}

resource "google_organization_policy" "resource_location_restriction"{
  org_id     = "${var.org_id}"
  constraint = "constraints/gcp.resourceLocations"

  list_policy {
    allow {
      values = "${var.resource_location_restriction}"
    }
  }
}

resource "google_organization_policy" "restrict_vm_public_ip"{
  org_id     = "${var.org_id}"
  constraint = "constraints/compute.vmExternalIpAccess"

  list_policy {
    deny {
      all = true
    }
  }
}
