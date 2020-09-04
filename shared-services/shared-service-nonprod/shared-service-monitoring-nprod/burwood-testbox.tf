//variables
variable "master_image" {
  description = "defines the master image name"
  type = "string"
  default = "windows-server-2019-dc-v20200609"
}

variable "env_level" {
  description = "prod vs nprod for Display and Labels"
  type = "string"
  default = "nprod"
}

variable "env_appcode" {
  description = "Abbreviation of Application Stack for netbios names"
  type = "string"
  default = "bwt"
}

variable "env_prefix" {
  description = "Application release level abbreviation used Display and Labels"
  type = "string"
  default = "burwood"
}

variable "env_envcode" {
  description = "consolidtated location and environment code for netbios names"
  type = "string"
  default = "t20"
}

//network
variable "svpc-project" {
  type = "string"
  default = "ss-nprod-svpc"
}

variable "svpc-project-networkname" {
  type = "string"
  default = "ss-nprod-svpc-vpc"
}

variable "svpc-subnetwork" {
  type = "string"
  default = "nonprod-apps-cidr-usc1"
}

//metadata

variable "addomain" {
  type = "string"
  default="admi.com"
}

variable "adDomianOU" {
  type = "string"
  default = "OU=test-servers,OU=servers-GCP,DC=admi,DC=com"
}

//resources
//burwood test machines

module "gcp_service_account_testbox" {
  source          = "../../../../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - testbox"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-test"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}
module "gcs_bucket_testbox1_uscentral1" {
  source                 = "../../../../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-testbox-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_testbox.service_account_email}"
  role                   = "roles/storage.objectAdmin"
  force_destroy_property = true

  labels = {
    stack  = "test"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname = "${var.bu_prefix}"
  }
}

module "compute-instance-standalone-server" {
  source     = "../../../../modules/compute_instance/standalone"
  project_id = "${var.customer_identifier_prefix}-${var.project_postfix}"

  // Instance Properties
  compute_image = "${var.master_image}"
  machine_type  = "custom-2-8192"
  region        = "${var.region}"
  zone          = "a"

  // Instance Naming
  env_initials   = "${var.env_envcode}"
  app_initials   = "${var.env_appcode}"
  stack_initials = "test01"

  target_tags = ["network-tag", "firewall-tag"]

  labels = {
    env     = "${var.env_prefix}"
    region  = "${var.region}"
    stack   = "test-box"
  }

  metadata        = {
    windows-startup-script-url = "gs://${module.gcs_bucket_testbox1_uscentral1.bucket_name}/boot.ps1"
    //windows-shutdown-script-url = "gs://${module.gcs_bucket_testbox1_uscentral1.bucket_name}/core-api-shutdown.ps1"
    bucketstore = "${module.gcs_bucket_testbox1_uscentral1.bucket_name}"
    addomain = "${var.addomain}"
    addomainou = "${var.adDomianOU}"
    appenv= "GCPQA1"
  }

  service_account_email = "${module.gcp_service_account_testbox.service_account_email}"
  subnetwork            = "${var.svpc-subnetwork}"
  subnetwork_project    = "${var.customer_identifier_prefix}-${var.svpc-project}"

  // Disk Information
  boot_disk_size = 100
  disk_type      = "pd-standard"

  disk_size_gb_2        = 600
  //disk_size_gb_3        = 60
}