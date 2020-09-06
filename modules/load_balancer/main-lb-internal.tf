# ------------------------------------------------------------------------------
# FORWARDING RULE
# ------------------------------------------------------------------------------

data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket     = "cuit-terraform-project"
    prefix     = "terraform/state/aspen-vpc"
  }
}


resource "google_compute_forwarding_rule" "default" {
  provider              = google-beta
  project               = var.project
  name                  = var.name
  region                = var.region
  network               = data.terraform_remote_state.network.outputs.network_name
  subnetwork            = data.terraform_remote_state.network.outputs.subnet_id
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.default.self_link
  ip_protocol           = var.protocol
  ports                 = var.ports
  ip_address            = var.static_ip_address
  allow_global_access   = true

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
  name    = "aspen"
  region  = "us-central1"
}


resource "google_compute_instance_template" "instance_template" {
  name_prefix = "instance-template-"
  machine_type = "n1-standard-1"
  region = "us-central1"

  // boot disk
  disk {
    # ...
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "google_compute_region_instance_group_manager" "aspen" {
  base_instance_name = "aspen-base"
  name = "aspen-igm"
  region = "us-central1"

  version {
    instance_template = "google_compute_instance_template.aspen.id"
    name = "aspen-temp"
  }


  named_port {
    name = "custom"
    port = 8888
  }
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