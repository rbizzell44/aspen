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
  service_account_email = "cuit-projectfactory-1234@cuit-terraform-project.iam.gserviceaccount.com"

  // Instance Properties
  //compute_image = data.google_compute_image.latest_image.self_link
  compute_image         = var.master_image
  machine_type  = "custom-2-8192"
  region        = var.region
  zone          = var.zone

  // Instance Naming
  env_initials   = var.env_envcode
  app_initials   = var.env_appcode
  stack_initials = "ssrs1"

  target_tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = var.env_envcode
    stack   = "sql-reporting"
    region  = var.region
   // appname = var.bu_prefix
  }


  subnetwork            = var.svpc-subnetwork
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"




       // Disk Information
      boot_disk_size   = 100
      disk_type        = "pd-ssd"
      disk_name_2      = "disk-2-sqlbackup-b"
      disk_name_3      = "disk-3-sqldata-d"
      disk_name_4      = "disk-4-sqllog-e"
      disk_name_5      = "disk-5-sqltemp-g"
      disk_name_6      = "disk-6-sqlbin-i"
      disk_size_gb_2   = 100
      disk_size_gb_3   = 500
      disk_size_gb_4   = 200
      disk_size_gb_5   = 200
      disk_size_gb_6   = 100


  }


