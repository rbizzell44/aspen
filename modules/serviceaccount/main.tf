// Create a GCP Service Account

resource "google_service_account" "service_account" {
  project      = "${var.project_id}"
  display_name = "${var.sa_display_name}"
  account_id   = "${var.account_id}"
}

// Uncomment below to private key for the Service Account
//resource "google_service_account_key" "mykey" {
//  service_account_id = google_service_account.service_account.name
//  private_key_type   = "${var.private_key_type}"
//}


// Outputs

output "service_account_email" {
  value = "${google_service_account.service_account.email}"
}

output "service_account_name" {
  value = "${google_service_account.service_account.name}"
}