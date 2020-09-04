// DNS records - Nonprod
data "google_compute_network" "network_name" {
  project = "${var.project_name}"
  name    = "${var.network_name}"
}

resource "google_dns_managed_zone" "managed_zone" {
  provider = google-beta
  project    = "${var.project_name}"
  name       = "${var.zone_name}"
  dns_name   = "${var.dns_name}"
  visibility = "private"

  private_visibility_config {
    networks {
      network_url = "${data.google_compute_network.network_name.self_link}"
    }
  }

  forwarding_config {
    target_name_servers {
      ipv4_address = "10.22.4.112"
      forwarding_path = "private"
    }
    target_name_servers {
      ipv4_address = "10.22.4.111"
      forwarding_path = "private"
    }
  }
}




//locals {
//  zone_record_keys = "${keys(var.zone_records)}"
//}

//resource "google_dns_record_set" "record_set" {
//  count = "${length(local.zone_record_keys)}"
//  name  = "${join(".", compact(list(lookup(var.zone_records[local.zone_record_keys[count.index]], "name"), var.dns_name)))}"
//  type  = "${lookup(var.zone_records[local.zone_record_keys[count.index]], "type")}"
//  ttl   = "${lookup(var.zone_records[local.zone_record_keys[count.index]], "ttl")}"
//
//  managed_zone = "${google_dns_managed_zone.managed_zone.name}"
//
//  rrdatas = ["${split(",", lookup(var.zone_records[local.zone_record_keys[count.index]], "rrdata", ""))}"]
//}
