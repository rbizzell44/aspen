# ------------------------------------------------------------------------------
# FORWARDING RULE
# ------------------------------------------------------------------------------

resource "google_compute_forwarding_rule" "default" {
  provider              = google-beta
  project               = var.project
  name                  = var.name
  region                = var.region
  network               = "aspen-vpc"
  subnetwork            = "aspen-vpc"
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.default.self_link
  ip_protocol           = var.protocol
  ports                 = var.ports
  ip_address            = var.static_ip_address
  allow_global_access   = true

}

data "google_compute_network" "vpc-network" {
  project = "cuit-terraform-project"
  name    = "aspen-vpc"
}

data "google_compute_subnetwork" "subnetwork-aspen" {
  project = "cuit-terraform-project"
  name    = aspen-vpc
  region  = us-central1
}



# ------------------------------------------------------------------------------
# CREATE BACKEND SERVICE
# ------------------------------------------------------------------------------

resource "google_compute_region_backend_service" "default" {
  provider         = google-beta
  project          = var.project
  name             = var.name
  region           = var.region
  protocol         = var.protocol
  session_affinity = var.session_affinity
  timeout_sec      = 300

  backend {
    group = data.google_compute_region_instance_group.managed-instance-group.self_link
  }

  health_checks = [
    google_compute_health_check.tcp.self_link
  ]
}

data "google_compute_region_instance_group" "managed-instance-group" {
  project = var.project
  name    = var.instance-group-name
  region  = var.region
}


# ------------------------------------------------------------------------------
# CREATE HEALTH CHECK - ONE OF ´http´ OR ´tcp´
# ------------------------------------------------------------------------------

resource "google_compute_health_check" "tcp" {
  project = var.project
  name    = var.name-hc

  tcp_health_check {
    port = var.health_check_port
  }

  check_interval_sec  = var.check_interval
  timeout_sec         = var.timeout_period
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
}