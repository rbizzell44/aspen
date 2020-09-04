// QA Stack - SQL Reporting

//module "instance_group_sql_reporting-us-central1" {
//  source      = "../../../../modules/instance_group_unmanaged/sql-reporting"
//  project_id  = "${var.customer_identifier_prefix}-${var.project_postfix}"
//  name        = "unmanaged"
//  environment = "${var.env_prefix}"
//  stack       = "sql-reporting"
//  region      = "${var.region}"
//  zone        = "a"
//  instance_list = [
//    "${module.compute-instance-sql-reporting-1-us-central1.instance_name}"
//  ]
//}

module "compute-instance-sql-reporting-1-us-central1" {
  source     = "../modules/compute_instance/sql-reporting"
  project_id = "${var.customer_identifier_prefix}-${var.project_postfix}"

  // Instance Properties
  //compute_image = "${data.google_compute_image.latest_image.self_link}"
  compute_image         = "${var.master_image}"
  machine_type  = "custom-2-8192"
  region        = "${var.region}"
  zone          = "a"

  // Instance Naming
  env_initials   = "${var.env_envcode}"
  app_initials   = "${var.env_appcode}"
  stack_initials = "ssrs1"

  target_tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "${var.env_envcode}"
    stack   = "sql-reporting"
    region  = "${var.region}"
    appname = "${var.bu_prefix}"
  }

 // metadata        = {
 //   windows-startup-script-url = "gs://${module.gcs_bucket_sql_reporting_uscentral1.bucket_name}/ssrs-boot.ps1"
 //   bucketstore = "${module.gcs_bucket_sql_reporting_uscentral1.bucket_name}"
 //   addomain = "${var.addomain}"
 //   addomainou = "${var.adDomianOU}"
 //   appenv= "${var.bu_prefix}"

  }
  

  subnetwork            = "${var.svpc-subnetwork}"
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"

  // Disk Information
  boot_disk_size = 100
  disk_type      = "pd-ssd"
  disk_name_2     = "disk-2-sqlbackup-b"
  disk_name_3     = "disk-3-sqldata-d"
  disk_name_4     = "disk-4-sqllog-e"
  disk_name_5     = "disk-5-sqltemp-g"
  disk_name_6     = "disk-6-sqlbin-i"
  disk_size_gb_2 = 100
  disk_size_gb_3 = 500
  disk_size_gb_4 = 200
  disk_size_gb_5 = 200
  disk_size_gb_6 = 100
}


// Stack - us-east4
//module "instance_group_sql_reporting-us-east4" {
//  source      = "../../../../modules/instance_group_unmanaged/sql-reporting"
//  project_id  = "${var.customer_identifier_prefix}-${var.project_postfix}"
//  name        = "unmanaged"
//  environment = "qa1"
//  stack       = "sql-reporting"
//  region      = "${var.region2}"
//  zone        = "a"
//  instance_list = [
//    "${module.compute-instance-sql-reporting-1-us-east4.instance_name}"
//  ]
//}
//
//module "compute-instance-sql-reporting-1-us-east4" {
//  source        = "../../../../modules/compute_instance/sql-reporting"
//  project_id    = "${var.customer_identifier_prefix}-${var.project_postfix}"
//
//  // Instance Properties
//  machine_type  = "custom-2-8192"
//  region        = "${var.region2}"
//  zone          = "a"
//
//  // Instance Naming
//  env_initials   = "q20"
//  app_initials   = "epm"
//  stack_initials = "srep1e"
//
//  target_tags   = ["network-tag", "firewall-tag"]
//
//  labels = {
//    env     = "qa1"
//    stack   = "sql-reporting"
//    region  = "us-east4"
//    domain  = "admi"
//    netbios = "q20epm"
//  }
//
//  metadata_name         = "ssrs-boot.ps1"
//  bucketstore_name      = "${module.gcs_bucket_sql_reporting_useast4.bucket_name}"
//  service_account_email = "${module.gcp_service_account_sql_reporting.service_account_email}"
//  subnetwork            = "nonprod-apps-cidr-use4"
//  subnetwork_project    = "${var.customer_identifier_prefix}-ss-nprod-svpc"
//
//  // Disk Information
//  boot_disk_size = 100
//  disk_type      = "pd-standard"
//  disk_name_2    = "test-disk-2"
//  disk_name_3    = "test-disk-3"
//  disk_name_4    = "test-disk-4"
//  disk_name_5    = "test-disk-5"
//  disk_name_6    = "test-disk-6"
//  disk_size_gb_2 = 100
//  disk_size_gb_3 = 500
//  disk_size_gb_4 = 200
//  disk_size_gb_5 = 200
//  disk_size_gb_6 = 100
//}