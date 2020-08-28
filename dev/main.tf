
module "gci_test" {
  source = "github.com/matti/terraform-google-compute-instance"

  amount       = 3
  region       = "us-east1"
  name         = "test"
  machine_type = "f1-micro"
  disk_size    = "32"
  disk_image   = "windows-cloud/windows-2019"
}

//resource  "google_compute_instance" "default" {
//  name = "aspen-test"
//  machine_type = "f1-micro"
 // zone = "us-east1-c"

 // boot_disk {
  //  initialize_params {
   //   image = "windows-cloud/windows-2019"
   // }
  //}

 // network_interface {

 //   network = "aspen-vpc"


  /}
/}


