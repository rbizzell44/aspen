variable "project_name" {
  description = "Name of project to house resource"
}

variable "zone_name" {
  description = "Name for the DNS zone resource"
}

variable "dns_name" {
  description = "Domain name for zone record"
}

variable "network_name" {
  description = "Network name of the shared vpc"
}

//variable "zone_records" {
//  description = "Subdomain records for domain"
//  type        = "map"
//}

