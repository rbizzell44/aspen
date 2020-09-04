//
// Firewall rules to be added to vpc on creation.  This is only a base set and can be extended under the shared vpc resource folders
//

###
### Allow DNS communication
###

resource "google_compute_firewall" "dns_allow" {
  name           = "dns-allow"
  project        = "${var.project_id}"
  network        = "${google_compute_network.vpc.name}"
  priority       = 2000
  direction      = "INGRESS"
  enable_logging = true

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  source_ranges = [
    "10.0.0.0/8",
    "168.168.0.0/16",
    "35.199.192.0/19"
  ]
}

resource "google_compute_firewall" "health_check_allow" {
  name      = "health-check-allow"
  project   = "${var.project_id}"
  network   = "${google_compute_network.vpc.name}"
  priority  = 2000
  direction = "INGRESS"
  enable_logging = true

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = [
    "35.191.0.0/16",
    "130.211.0.0/22"
  ]
}

resource "google_compute_firewall" "admi_allow" {
  name      = "admi-allow"
  project   = "${var.project_id}"
  network   = "${google_compute_network.vpc.name}"
  priority  = 2000
  direction = "INGRESS"
  enable_logging = true

  allow {
    protocol = "tcp"
    ports    = ["22", "25", "80", "88", "135", "137", "139", "389", "443", "445", "636", "1433-1434", "2525", "3978", "7500", "7507", "24158", "3268", "3269", "3389", "5000-5100", "5985", "8000", "8089", "8250-8260", "8443", "9100", "9997", "28443", "49000-65535", "51443"]
    //ports = ["0-65535"]
    //"7800-7806",  "9800-9806",
  }

  allow {
    protocol = "udp"
    ports    = ["88", "135", "138", "139", "389", "636", "49152-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.0.0.0/8",
    "168.168.0.0/16"
  ]
}

resource "google_compute_firewall" "svpc_network_allow" {
  name      = "${var.svpc_network_name}"
  project   = "${var.project_id}"
  network   = "${google_compute_network.vpc.name}"
  priority  = 2000
  direction = "INGRESS"
  enable_logging = true

  allow {
    protocol = "tcp"
    //ports    = ["22", "80", "88", "135", "137", "139", "389", "443", "445", "636", "1433-1434", "7500", "7507", "3268", "3269", "3389", "5985", "7800-7806", "8000", "8089", "8250", "8251", "8300-8399", "8443", "9800", "9997", "49152-65535"]
    //ports    = ["22", "80", "135", "137", "139", "389", "443", "636", "1433-1434", "2222", "2382-2383", "3266", "3269", "3389", "5022", "5985", "8250", "7800-7806", "9800","49152-65535"]
    // SMB "445",
    ports = ["0-65535"]
    }

  allow {
    protocol = "udp"
    ports    = ["88", "135", "138", "139", "389", "636", "1434", "123","49152-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = "${var.source_range_ip}"
}

resource "google_compute_firewall" "svpc_egress_vendor_ip" {
  name      = "egress-vendor-ips"
  project   = "${var.project_id}"
  network   = "${google_compute_network.vpc.name}"
  priority  = 2000
  direction = "EGRESS"
  enable_logging = true

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  destination_ranges = [
    "167.107.82.39",   // https://api.experianmarketingservices.com/
    "167.107.82.99",   // https://api.edq.com/
    "170.138.220.53",  // Change Healthcare - https://access.emdeon.com
    "170.138.32.222",  // Total Rev – Application Integration: Endpoint Prefixfor ERA: https://claimservices.webmddental.com/ERA/Request.aspx
    "64.57.254.10",    // NEA - https://secure1.nea-fast.com
    "207.189.100.248", // https://portal.mygenesiscredit.com
    "23.54.189.197",   // Care Credit – https://www.b2bcreditservices.com
    "205.144.52.178",  // Dental First – https://retailuat.alldata.net:443
    "205.144.52.23",   // https://axes.alldata.net:443
    "192.54.53.120",   // Fortiva – https://qaservices.fortivafinancingsolutions.com
    "208.36.213.120",  // Fortiva – https://qaservices.fortivafinancingsolutions.com
    "192.54.53.119",   // https://services.fortivafinancingsolutions.com
    "52.250.110.167",  // Dosespot – https://my.staging.dosespot.com
    "52.183.28.19",    // https://my.dosespot.com
    "3.90.141.34"      // Denti AI - https://master.denti.ai/
  ]
}