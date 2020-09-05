/// Project Variables File

variable "master_image" {
  description = "defines the master image name"
  type = string
  default = "windows-server-2019-dc-v20200609"
}

//variable "bu_prefix" {
//  type  "string
//}

variable "env_level" {
  description = "prod vs nonprod"
  type = string
  default = "nprod"
}

variable "env_appsettings" {
  description = "Variable required by application to note what .NET environment settings file should be used"
  type = string
  default = "GCPDEV"
}

variable "env_appcode" {
  description = "Abbreviation of Application Stack"
  type = string
  default = "epm"
}

variable "env_prefix" {
  description = "Application release level abbreviation used for name generation"
  type = string
  default = "dev"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "env_envcode" {
  type = string
  default = "d20"
}

variable "project_postfix" {
  type = string
  default = "epms-nprod-dev-apptier"
}

//network
variable "svpc-project" {
  type = string
  default = "ss-nprod-svpc"
}

variable "svpc-project-networkname" {
  type = string
  default = "ss-nprod-svpc-vpc"
}

variable "svpc-subnetwork" {
  type = string
  default = "nonprod-apps-cidr-usc1"
}

//metadata

variable "addomain" {
  type = string
  default="admi.com"
}

variable "adDomianOU" {
  type = string
  default = "OU=nonprod,OU=servers-GCP,DC=admi,DC=com"
}

variable "customer_identifier_prefix" {
  type = string
}

variable "service_port" {
}

variable "service_port_name" {

}
variable " bu_prefix" {

}