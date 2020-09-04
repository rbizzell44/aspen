project_id      = "admi-ss-prod-firewall"                      # Your project ID for the deployment
public_key_path = "../../../deployment/jasonpub.ssh"   # Your SSH Key

fw_panos        = "byol-904"              # Uncomment for PAN-OS 9.0.4 - BYOL
#fw_panos        = "bundle1-904"           # Uncomment for PAN-OS 9.0.4 - PAYG Bundle 1
#fw_panos        = "bundle2-904"           # Uncomment for PAN-OS 9.0.4 - PAYG Bundle 2


#-------------------------------------------------------------------

regions            = ["us-central1", "us-east4"]

mgmt_vpc          = "mgmt-vpc"
mgmt_subnet       = ["mgmt","mgmt-dr"]
mgmt_cidr         = ["10.132.0.0/24","10.132.2.0/24"]
mgmt_sources      = ["0.0.0.0/0"]

untrust_vpc       = "untrust-vpc"
untrust_subnet    = ["untrust","untrust-dr"]
untrust_cidr      = ["10.132.1.32/27","10.132.3.32/27"]

trust_vpc         = "trust-vpc"
trust_subnet      = ["trust","trust-dr"]
trust_cidr        = ["10.132.1.0/27","10.132.3.0/27"]

spoke1_vpc        = "spoke1-vpc"
spoke1_subnets    = ["spoke1-subnet1"]
spoke1_cidrs      = ["10.1.0.0/24"]
spoke1_vms        = ["spoke1-vm1", "spoke1-vm2"]
spoke1_ilb        = "spoke1-intlb"
spoke1_ilb_ip     = "10.1.0.100"

spoke2_vpc        = "spoke2-vpc"
spoke2_subnets    = ["spoke2-subnet1"]
spoke2_cidrs      = ["10.2.0.0/24"]
spoke2_vms        = ["spoke2-vm1"]
spoke_user        = "demo"

fw_names_common  = ["vmseries01",]
fw_names_common1  = ["vmseries-dr",]
fw_machine_type   = "n1-standard-4"

extlb_name          = "vmseries-extlb"
intlb_name          = "vmseries-intlb"

//regions            = ["us-central1", "us-east4"]
//mgmt_vpc          = "mgmt-vpc"
//mgmt_subnet       = ["mgmt"]
//mgmt_cidr         = ["10.132.0.0/24"]
//mgmt_sources      = ["151.181.74.160/27", "69.46.235.0/27"]
//untrust_vpc       = "untrust-vpc"
//untrust_subnet    = ["untrust"]
//untrust_cidr      = ["10.132.1.32/27"]
//trust_vpc         = "trust-vpc"
//trust_subnet      = ["trust"]
//trust_cidr        = ["10.132.1.0/27"]
//spoke1_vpc        = "spoke1-vpc"
//spoke1_subnets    = ["spoke1-subnet1"]
//spoke1_cidrs      = ["10.1.0.0/24"]
//spoke1_vms        = ["spoke1-vm1", "spoke1-vm2"]
//spoke1_ilb        = "spoke1-intlb"
//spoke1_ilb_ip     = "10.1.0.100"
//spoke2_vpc        = "spoke2-vpc"
//spoke2_subnets    = ["spoke2-subnet1"]
//spoke2_cidrs      = ["10.2.0.0/24"]
//spoke2_vms        = ["spoke2-vm1"]
//spoke_user        = "demo"
//fw_names_common  = ["vmseries01", "vmseries02"]
//fw_machine_type   = "n1-standard-4"
//extlb_name          = "vmseries-extlb"
//intlb_name          = "vmseries-intlb"
