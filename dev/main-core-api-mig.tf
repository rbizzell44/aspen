 //Core API

module "managed-instance-group-core-api-us-central1" {
  source     = "../modules/instance_group_managed/iis-mig"
  project_id = "${var.customer_identifier_prefix}-${var.project_postfix}"

  // Instance Template
  name                  = "managed-${var.env_prefix}-core-api-${var.region}"
  //compute_image = "${data.google_compute_image.latest_image.self_link}"
  compute_image         = var.master_image

  machine_type          = "custom-8-32768" //"custom-2-8192"
  region                = var.region
  subnetwork            = var.svpc-subnetwork
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"

  disk_type             = "pd-ssd"
  disk_size_gb_1        = 120
  disk_size_gb_2        = 120
  disk_size_gb_3        = 120

  target_tags     = ["network-tag", "firewall-tag"]

 // service_account_email = "${module.gcp_service_account_core_api.service_account_email}"
 // healing_delay         = 600
//  cooldown_period       = 6000

 // metadata        = {
 //   windows-startup-script-url = "gs://${module.gcs_bucket_core_api_uscentral1.bucket_name}/core-api-boot.ps1"
  //  windows-shutdown-script-url = "gs://${module.gcs_bucket_core_api_uscentral1.bucket_name}/core-api-shutdown.ps1"
  //  bucketstore = "${module.gcs_bucket_core_api_uscentral1.bucket_name}"

    //addomain   =  var.addomain
   // addomainou =  var.adDomianOU
   // appenv     =  var.env_appsettings
  }



  labels = {
    env     = var.env_prefix
    region  = var.region
    stack   = "core-api"
  }

  // Instance Manager
  env_initials   = var.env_envcode
  app_initials   = var.env_appcode
  stack_initials = "api"
  target_size    = 2

  // Autohealing
  interval_check      = 300
  timeout_period      = 300
  healthy_threshold   = 2
  unhealthy_threshold = 3

  health_check_request_path = "/index.html"

  // Autoscaling
  autoscaling     = true
  min_replicas    = 2
  max_replicas    = 4
  autoscaling_cpu = 0.75
}