variable "sa_display_name" {
  description = "Display name for the Service Account."
  default     = ""
}

variable "account_id" {
  type = string
}

variable "project_id" {
  type = string
}

// Uncomment below to private key for the Service Account
//variable "private_key_type" {
//  type    = "string"
//  default = "TYPE_GOOGLE_CREDENTIALS_FILE"
//}