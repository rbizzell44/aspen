/* ============================================
--  Shared Services Nonproduction
   ============================================ */
//
// Shared Services Nonproduction Resources
// This is a placeholder for nonproduction shared service project resources

//// nonprod sandbox
//module "ss_sandbox_nonprod" {
//  source                = "../../../modules/instance_group/"
//  project_id            = "${var.customer_identifier_prefix}-sharedsvcs-nprod"
//  name                  = "${var.sandbox_name}-nonprod"
//  region                = "${var.region}"
//  subnetwork            = "${var.sandbox_subnetwork_nonprod}"
//  subnetwork_project    = "${var.customer_identifier_prefix}-network-nonprod"
//  compute_image         = "${var.sandbox_image}"
//  target_tags           = "${var.sandbox_tags}"
//  labels                = "${var.sandbox_labels}"
//  rolling_update_policy = "${var.sandbox_policies_nonprod}"
//}


//
// Shared Services Nonprod - Service Accounts
//

//module "gcp_service_account_ad" {
//  source          = "../../../../modules/serviceaccount"
//  sa_display_name = "Nonprod Service Account - AD"
//  account_id      = "admi-ss-nprod-ad"
//  project_id      = "${var.customer_identifier_prefix}-ss-nprod"
//}
//
//module "gcp_service_account_autosys" {
//  source          = "../../../../modules/serviceaccount"
//  sa_display_name = "Nonprod Service Account - Autosys"
//  account_id      = "admi-ss-nprod-autosys"
//  project_id      = "${var.customer_identifier_prefix}-ss-nprod"
//}

//module "gcp_service_account_splunk" {
//  source          = "../../../modules/serviceaccount"
//  sa_display_name = "Nonprod Service Account - Splunk"
//  account_id      = "admi-ss-nprod-splunk"
//  project_id      = "${var.customer_identifier_prefix}-ss-nprod"
//}

//
// Shared Services Prod - GCS Buckets - us-central1
//
//
//module "gcs_bucket_ad_uscentral1" {
//  source                 = "../../../../modules/storagebucket"
//  location               = "${var.region}"
//  bucket_name            = "${var.customer_identifier_prefix}-ad-nprod-${var.region}"
//  project_id             = "${var.customer_identifier_prefix}-ss-nprod"
//  sa_email               = "${module.gcp_service_account_ad.service_account_email}"
//  role                   = "roles/storage.objectViewer"
//  force_destroy_property = true
//
//  labels = {
//    stack  = "ad"
//    env    = "ss-nprod"
//    region = "us-central1"
//  }
//}
//
//module "gcs_bucket_autosys_uscentral1" {
//  source                 = "../../../../modules/storagebucket"
//  location               = "${var.region}"
//  bucket_name            = "${var.customer_identifier_prefix}-autosys-nprod-${var.region}"
//  project_id             = "${var.customer_identifier_prefix}-ss-nprod"
//  sa_email               = "${module.gcp_service_account_autosys.service_account_email}"
//  role                   = "roles/storage.objectViewer"
//  force_destroy_property = true
//
//  labels = {
//    stack  = "autosys"
//    env    = "ss-nprod"
//    region = "us-central1"
//  }
//}
//
//
////
//// Shared Services Nonprod - GCS Buckets - us-east4
////
//
//module "gcs_bucket_ad_useast4" {
//  source                 = "../../../../modules/storagebucket"
//  location               = "${var.region2}"
//  bucket_name            = "${var.customer_identifier_prefix}-ad-nprod-${var.region2}"
//  project_id             = "${var.customer_identifier_prefix}-ss-nprod"
//  sa_email               = "${module.gcp_service_account_ad.service_account_email}"
//  role                   = "roles/storage.objectViewer"
//  force_destroy_property = true
//
//  labels = {
//    stack  = "ad"
//    env    = "ss-nprod"
//    region = "us-east4"
//  }
//}
//
//module "gcs_bucket_autosys_useast4" {
//  source                 = "../../../../modules/storagebucket"
//  location               = "${var.region2}"
//  bucket_name            = "${var.customer_identifier_prefix}-autosys-nprod-${var.region2}"
//  project_id             = "${var.customer_identifier_prefix}-ss-nprod"
//  sa_email               = "${module.gcp_service_account_autosys.service_account_email}"
//  role                   = "roles/storage.objectViewer"
//  force_destroy_property = true
//
//  labels = {
//    stack  = "autosys"
//    env    = "ss-nprod"
//    region = "us-east4"
//  }
//}