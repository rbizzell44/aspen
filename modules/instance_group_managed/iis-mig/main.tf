//
// Managed Instance Group Template
//

resource "google_compute_instance_template" "default" {
  project      = var.project_id
  name_prefix  = var.name
  region       = var.region
  machine_type = var.machine_type
  tags         = var.target_tags
  labels       = var.labels

  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
  }

  metadata = var.metadata

  scheduling {
    automatic_restart = var.automatic_restart
  }

  service_account {
    email  = var.service_account_email
    scopes = var.api_scopes
  }

  lifecycle {
    create_before_destroy = true
  }

  disk {
    source_image = var.compute_image
    auto_delete  = var.disk_auto_delete
    boot         = true
    type         = "PERSISTENT"
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb_1
  }

  disk {
    auto_delete  = var.disk_auto_delete
    boot         = false
    type         = "PERSISTENT"
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb_2
  }

  disk {
    auto_delete  = var.disk_auto_delete
    boot         = false
    type         = "PERSISTENT"
    disk_type    = var.disk_type
    disk_size_gb = var.disk_size_gb_3
  }
}

resource "google_compute_region_instance_group_manager" "default" {
  project            = var.project_id
  name               = var.name
  base_instance_name = "${var.env_initials}${var.app_initials}${var.stack_initials}"
  region             = var.region
  target_size        = var.target_size

  version {
    instance_template = google_compute_instance_template.default.self_link
    name              = "instance_group_manager"
  }

  named_port {
    name = "http"
    port = 80
  }

  named_port {
    name = "tcp"
    port = 443
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.self_link
    initial_delay_sec = var.healing_delay
  }
}

resource "google_compute_health_check" "autohealing" {
  project             = var.project_id
  name                = compute-health-check
  check_interval_sec  = var.interval_check
  timeout_sec         = var.timeout_period
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold

  http_health_check {
    request_path = var.health_check_request_path
    port = 80
  }
}

resource "google_compute_region_autoscaler" "default" {
  project = var.project_id
  count   = var.autoscaling ? 1 : 0
  name    = var.name
  region  = var.region
  target  = google_compute_region_instance_group_manager.default.self_link

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    cpu_utilization {
      target = var.autoscaling_cpu
    }
  }
}