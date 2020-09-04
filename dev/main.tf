data "google_compute_image" "latest_image" {
  family  = "windows-2019"
  project = "windows-cloud"
}

module "gcp_service_account_core_api" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - Core API"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-core-api"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

module "gcp_service_account_log_api" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - Log API"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-log-api"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

module "gcp_service_account_ncache" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - NCache"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-ncache"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

module "gcp_service_account_sql_reporting" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - SQL Reporting"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-sql-rs"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

module "gcp_service_account_web_ui" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - Web UI"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-web-ui"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

module "gcp_service_account_doc_api" {
  source          = "../modules/serviceaccount"
  sa_display_name = "${var.bu_prefix} - ${var.env_prefix} - Service Account - doc API"
  account_id      = "${var.bu_prefix}-${var.env_level}-${var.env_prefix}-app-doc-api"
  project_id      = "${var.customer_identifier_prefix}-${var.project_postfix}"
}

//
// EPMS dev Nonprod - Buckets (us-central1)
//

module "gcs_bucket_core_api_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-core-api-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_core_api.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "core-api"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}

module "gcs_bucket_log_api_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-log-api-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_log_api.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "log-api"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}

module "gcs_bucket_ncache_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-ncache-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_ncache.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "ncache"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}

module "gcs_bucket_sql_reporting_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-sql-reporting-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_sql_reporting.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "sql-reporting"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}

module "gcs_bucket_web_ui_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-web-ui-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_web_ui.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "web-ui"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}

module "gcs_bucket_doc_api_uscentral1" {
  source                 = "../modules/storagebucket"
  location               = "${var.region}"
  bucket_name            = "${var.project_postfix}-doc-api-${var.region}"
  project_id             = "${var.customer_identifier_prefix}-${var.project_postfix}"
  sa_email               = "${module.gcp_service_account_doc_api.service_account_email}"
  role                   = "roles/storage.objectViewer"
  force_destroy_property = true

  labels = {
    stack  = "doc-api"
    env    = "${var.env_prefix}"
    region = "${var.region}"
    appname     = "${var.bu_prefix}"
  }
}