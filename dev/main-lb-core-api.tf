//Load Balancer - Core API

module "gce-lb-http" {
  source = "GoogleCloudPlatform/lb-http/google"
  version = "~> 4.2"
  name = "group-http-lb"
  project = "cuit-terraform-project"
  target_tags = ["module.mig1.target_tags", "module.mig2.target_tags"]
  backends = {
    default = {
      description                     = null
      protocol                        = "HTTP"
      port                            = var.service_port
      port_name                       = var.service_port_name
      timeout_sec                     = 10
      connection_draining_timeout_sec = null
      enable_cdn                      = false
      session_affinity                = null
      affinity_cookie_ttl_sec         = null

      health_check = {
        check_interval_sec  = null
        timeout_sec         = null
        healthy_threshold   = null
        unhealthy_threshold = null
        request_path        = "/"
        port                = var.service_port
        host                = null
        logging             = null
      }

      log_config = {
        enable = true
        sample_rate = 1.0
      }

      groups = [
        {
          # Each node pool instance group should be added to the backend.
          group                        = var.backend
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = null
        },
      ]
    }
  }
}

module "load-balancer-core-api-uscentral1" {
  source            = "../modules/load_balancer"
  project           = "${var.customer_identifier_prefix}-${var.project_postfix}"
  stack             = "core-api"
  region            = var.region
  name              = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-lb-core-api-${var.region}"
  name-hc           = "dev"
  ports             = ["443"]
  //protocol = [TCP UDP ESP AH SCTP ICMP]

  static_ip_address = "10.128.0.50"

  // Network and Instance Group
  instance-group-name = module.managed-instance-group-core-api-us-central1.name
  network_project     = "${var.customer_identifier_prefix}-${var.svpc-project}"
  network             = "${var.customer_identifier_prefix}-${var.svpc-project-networkname}"
  subnetwork            = var.svpc-subnetwork

  // Health Check
  http_health_check   = true
  health_check_port   = 80
  check_interval      = 20
  timeout_period      = 20
  healthy_threshold   = 2
  unhealthy_threshold = 3
}

//module "load-balancer-core-api-useast4" {
//  source            = "../../../../modules/load_balancer"
//  project           = "${var.customer_identifier_prefix}-${var.project_postfix}"
//  stack             = "core-api"
//  region            = "${var.region2}"
//  name              = "${var.bu_prefix}-nprod-lb-core-api-${var.region2}"
//  ports             = ["443"]
//  static_ip_address = "10.131.24.31"
//
//  // Network and Instance Group
//  instance-group-name = "${module.managed-instance-group-qa-core-api-us-east4.name}"
//  network_project     = "${var.customer_identifier_prefix}-ss-nprod-svpc"
//  network             = "${var.customer_identifier_prefix}-ss-nprod-svpc-vpc"
//  subnetwork          = "nonprod-apps-cidr-use4"
//
//  // Health Check
//  http_health_check   = true
//  health_check_port   = 80
//  check_interval      = 20
//  timeout_period      = 20
//  healthy_threshold   = 2
//  unhealthy_threshold = 2
//}