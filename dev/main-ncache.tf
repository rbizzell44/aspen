// QA Stack - NCache

//// us-central1 Stack
//module "unmanaged-instance-group-ncache-us-central1" {
//  source      = "../../../../modules/instance_group_unmanaged/ncache"
//  project_id  = "${var.customer_identifier_prefix}-${var.project_postfix}"
//  name        = "unmanaged"
//  environment = "${var.env_envcode}"
//  stack       = "ncache"
//  region      = "${var.region}"
//  zone        = "a"
//  instance_list = [
//    "${module.compute-instance-ncache-1-us-central1.instance_name}",
//    "${module.compute-instance-ncache-2-us-central1.instance_name}"
//  ]
//}

module "compute-instance-ncache-1-us-central1" {
  source     = "../modules/compute_instance/ncache"
  project_id = "${var.customer_identifier_prefix}-${var.project_postfix}"

  // Instance Properties
  //compute_image = "${data.google_compute_image.latest_image.self_link}"
  compute_image         = "${var.master_image}"
  machine_type  = "custom-8-49152"
  region        = "${var.region}"
  zone          = "a"

  // Instance Naming
  env_initials   = "${var.env_envcode}"
  app_initials   = "${var.env_appcode}"
  stack_initials = "ncache1"

  target_tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "${var.env_prefix}"
    region  = "${var.region}"
    stack   = "ncache"
    appname     = "${var.bu_prefix}"
  }

  metadata        = {
    windows-startup-script-url = "gs://${module.gcs_bucket_ncache_uscentral1.bucket_name}/ncache-boot.ps1"
    bucketstore = "${module.gcs_bucket_ncache_uscentral1.bucket_name}"
    addomain = "${var.addomain}"
    addomainou = "${var.adDomianOU}"
    appenv= "${var.env_appsettings}"
    appname     = "${var.bu_prefix}"
  }

  bucketstore_name      = "${module.gcs_bucket_ncache_uscentral1.bucket_name}"
  service_account_email = "${module.gcp_service_account_ncache.service_account_email}"
  subnetwork            = "${var.svpc-subnetwork}"
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"

  // Disk Information
  boot_disk_size = 512 //120
  disk_type      = "pd-ssd"
}

module "compute-instance-ncache-2-us-central1" {
  source     = "../modules/compute_instance/ncache"
  project_id = "${var.customer_identifier_prefix}-${var.project_postfix}"

  // Instance Properties
  //compute_image = "${data.google_compute_image.latest_image.self_link}"
  compute_image         = "${var.master_image}"
  machine_type  = "custom-8-49152"
  region        = "${var.region}"
  zone          = "b"

  // Instance Naming
  env_initials   = "${var.env_envcode}"
  app_initials   = "${var.env_appcode}"
  stack_initials = "ncache2"

  target_tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "${var.env_prefix}"
    region  = "${var.region}"
    stack   = "ncache"
    appname     = "${var.bu_prefix}"
  }

  metadata        = {
    windows-startup-script-url = "gs://${module.gcs_bucket_ncache_uscentral1.bucket_name}/ncache-boot.ps1"
    bucketstore = "${module.gcs_bucket_ncache_uscentral1.bucket_name}"
    addomain = "${var.addomain}"
    addomainou = "${var.adDomianOU}"
    appenv= "${var.env_appsettings}"
  }

  bucketstore_name      = "${module.gcs_bucket_ncache_uscentral1.bucket_name}"
  service_account_email = "${module.gcp_service_account_ncache.service_account_email}"
  subnetwork            = "${var.svpc-subnetwork}"
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"

  // Disk Information
  boot_disk_size = 512 //120
  disk_type      = "pd-ssd"
}


// us-east4 Stack
//module "unmanaged-instance-group-qa-ncache-us-east4" {
//  source      = "../../../../modules/instance_group_unmanaged/ncache"
//  project_id  = "${var.customer_identifier_prefix}-${var.project_postfix}"
//  name        = "unmanaged"
//  environment = "qa1"
//  stack       = "ncache"
//  region      = "${var.region}"
//  zone        = "a"
//  instance_list = [
//    "${module.compute-instance-ncache-1-us-east4.instance_name}",
//    "${module.compute-instance-ncache-2-us-east4.instance_name}"
//  ]
//}
//
//module "compute-instance-ncache-1-us-east4" {
//  source        = "../../../../modules/compute_instance/ncache"
//  project_id    = "${var.customer_identifier_prefix}-${var.project_postfix}"
//
//  // Instance Properties
//  compute_image = "windows-server-2019-dc-v20200211"
//  machine_type  = "custom-8-49152"
//  region        = "${var.region}"
//  zone          = "a"
//
//  // Instance Naming
//  env_initials   = "q20"
//  app_initials   = "epm"
//  stack_initials = "ncache1e"
//
//  target_tags   = ["network-tag", "firewall-tag"]
//
//  labels = {
//    env     = "qa1"
//    stack   = "ncache"
//    region  = "us-east4"
//    domain  = "admi"
//    netbios = "q20epm"
//  }
//
//  metadata_name         = "webui-boot.ps1"
//  bucketstore_name      = "${module.gcs_bucket_ncache_useast4.bucket_name}"
//  service_account_email = "${module.gcp_service_account_ncache.service_account_email}"
//  subnetwork            = "nonprod-apps-cidr-use4"
//  subnetwork_project    = "${var.customer_identifier_prefix}-ss-nprod-svpc"
//
//  // Disk Information
//  boot_disk_size = 50
//  disk_type      = "pd-standard"
//}
//
//module "compute-instance-ncache-2-us-east4" {
//  source        = "../../../../modules/compute_instance/ncache"
//  project_id    = "${var.customer_identifier_prefix}-${var.project_postfix}"
//
//  // Instance Properties
//  compute_image = "windows-server-2019-dc-v20200211"
//  machine_type  = "custom-8-49152"
//  region        = "${var.region}"
//  zone          = "a"
//
//  // Instance Naming
//  env_initials   = "q20"
//  app_initials   = "epm"
//  stack_initials = "ncache2e"
//
//  target_tags   = ["network-tag", "firewall-tag"]
//
//  labels = {
//    env     = "qa1"
//    stack   = "ncache"
//    region  = "us-east4"
//    domain  = "admi"
//    netbios = "q20epm"
//  }
//
//  metadata_name         = "webui-boot.ps1"
//  bucketstore_name      = "${module.gcs_bucket_ncache_useast4.bucket_name}"
//  service_account_email = "${module.gcp_service_account_ncache.service_account_email}"
//  subnetwork            = "nonprod-apps-cidr-use4"
//  subnetwork_project    = "${var.customer_identifier_prefix}-ss-nprod-svpc"
//
//  // Disk Information
//  boot_disk_size = 50
//  disk_type      = "pd-standard"
//}