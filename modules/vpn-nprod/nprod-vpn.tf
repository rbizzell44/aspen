// Google Cloud Router
resource "google_compute_router" "nprod_router_1" {
  project  = "${var.network_proj_id}"
  provider = google-beta
  region   = "us-central1"
  name     = "nprod-ha-vpn-router1"
  network  = "admi-ss-nprod-svpc-vpc"

  bgp {
    asn = "64754"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]

    // Custom route for DNS Forwarding
    advertised_ip_ranges {
      range = "35.199.192.0/19"
    }
  }
}

resource "google_compute_router" "nprod_router_2" {
  project  = "${var.network_proj_id}"
  provider = google-beta
  region   = "us-east4"
  name     = "nprod-ha-vpn-router2"
  network  = "admi-ss-nprod-svpc-vpc"

  bgp {
    asn = "64755"
    advertise_mode    = "CUSTOM"
    advertised_groups = ["ALL_SUBNETS"]

    // Custom route for DNS Forwarding
    advertised_ip_ranges {
      range = "35.199.192.0/19"
    }
  }
}


// HA VPN Gateways
resource "google_compute_ha_vpn_gateway" "ha_gateway_1" {
  project  = "${var.network_proj_id}"
  provider = google-beta
  region   = "us-central1"
  name     = "nprod-ha-vpn-gateway1"
  network  = "admi-ss-nprod-svpc-vpc"
}

resource "google_compute_ha_vpn_gateway" "ha_gateway_2" {
  project  = "${var.network_proj_id}"
  provider = google-beta
  region   = "us-east4"
  name     = "nprod-ha-vpn-gateway2"
  network  = "admi-ss-nprod-svpc-vpc"
}

// External HA VPN Gateways
resource "google_compute_external_vpn_gateway" "external_gateway_1" {
  project         = "${var.network_proj_id}"
  provider        = google-beta
  name            = "admi-external-gateway1"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  description     = "An externally managed VPN gateway"
  interface {
    id         = 0
    ip_address = "151.181.74.186"
  }
}

resource "google_compute_external_vpn_gateway" "external_gateway_2" {
  project         = "${var.network_proj_id}"
  provider        = google-beta
  name            = "admi-external-gateway2"
  redundancy_type = "SINGLE_IP_INTERNALLY_REDUNDANT"
  description     = "An externally managed VPN gateway"
  interface {
    id         = 0
    ip_address = "151.181.74.186"
  }
}

// VPN Tunnels
resource "google_compute_vpn_tunnel" "tunnel1a" {
  project                         = "${var.network_proj_id}"
  provider                        = google-beta
  name                            = "nprod-ha-vpn-tunnel-1a"
  region                          = "us-central1"
  vpn_gateway                     = google_compute_ha_vpn_gateway.ha_gateway_1.name
  peer_external_gateway           = google_compute_external_vpn_gateway.external_gateway_1.name
  peer_external_gateway_interface = 0
  shared_secret                   = "BwtznfvfvQ1LtrC2bTte"
  router                          = google_compute_router.nprod_router_1.name
  vpn_gateway_interface           = 0
}

resource "google_compute_vpn_tunnel" "tunnel1b" {
  project                         = "${var.network_proj_id}"
  provider                        = google-beta
  name                            = "nprod-ha-vpn-tunnel-1b"
  region                          = "us-central1"
  vpn_gateway                     = google_compute_ha_vpn_gateway.ha_gateway_1.name
  peer_external_gateway           = google_compute_external_vpn_gateway.external_gateway_1.name
  peer_external_gateway_interface = 0
  shared_secret                   = "gn2dEHD8TggQtLKzPFHJ"
  router                          = google_compute_router.nprod_router_1.name
  vpn_gateway_interface           = 1
}

resource "google_compute_vpn_tunnel" "tunnel2a" {
  project                         = "${var.network_proj_id}"
  provider                        = google-beta
  name                            = "nprod-ha-vpn-tunnel-2a"
  region                          = "us-east4"
  vpn_gateway                     = google_compute_ha_vpn_gateway.ha_gateway_2.name
  peer_external_gateway           = google_compute_external_vpn_gateway.external_gateway_2.name
  peer_external_gateway_interface = 0
  shared_secret                   = "nbDCfB1KTydtNzGMbVwj"
  router                          = google_compute_router.nprod_router_2.name
  vpn_gateway_interface           = 0
}

resource "google_compute_vpn_tunnel" "tunnel2b" {
  project                         = "${var.network_proj_id}"
  provider                        = google-beta
  name                            = "nprod-ha-vpn-tunnel-2b"
  region                          = "us-east4"
  vpn_gateway                     = google_compute_ha_vpn_gateway.ha_gateway_2.name
  peer_external_gateway           = google_compute_external_vpn_gateway.external_gateway_2.name
  peer_external_gateway_interface = 0
  shared_secret                   = "gDsnsNAprPfTuP1WCmLX"
  router                          = google_compute_router.nprod_router_2.name
  vpn_gateway_interface           = 1
}

// GCP Cloud Router and Interface 1
resource "google_compute_router_interface" "nprod_router_interface1a" {
  project    = "${var.network_proj_id}"
  provider   = google-beta
  name       = "nprod-router-interface1a"
  router     = google_compute_router.nprod_router_1.name
  region     = "us-central1"
  ip_range   = "169.254.12.18/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1a.name
}

resource "google_compute_router_peer" "nprod_router_peer1a" {
  project                   = "${var.network_proj_id}"
  provider                  = google-beta
  name                      = "nprod-router-peer1a"
  router                    = google_compute_router.nprod_router_1.name
  region                    = "us-central1"
  peer_ip_address           = "169.254.12.17"
  peer_asn                  = "64700"
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.nprod_router_interface1a.name
}

resource "google_compute_router_interface" "nprod_router_interface1b" {
  project    = "${var.network_proj_id}"
  provider   = google-beta
  name       = "nprod-router-interface1b"
  router     = google_compute_router.nprod_router_1.name
  region     = "us-central1"
  ip_range   = "169.254.12.22/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel1b.name
}

resource "google_compute_router_peer" "nprod_router_peer1b" {
  project                   = "${var.network_proj_id}"
  provider                  = google-beta
  name                      = "nprod-router-peer1b"
  router                    = google_compute_router.nprod_router_1.name
  region                    = "us-central1"
  peer_ip_address           = "169.254.12.21"
  peer_asn                  = "64700"
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.nprod_router_interface1b.name
}

// GCP Cloud Router and Interface 2
resource "google_compute_router_interface" "nprod_router_interface2a" {
  project    = "${var.network_proj_id}"
  provider   = google-beta
  name       = "nprod-router-interface2a"
  router     = google_compute_router.nprod_router_2.name
  region     = "us-east4"
  ip_range   = "169.254.12.26/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel2a.name
}

resource "google_compute_router_peer" "nprod_router_peer2a" {
  project                   = "${var.network_proj_id}"
  provider                  = google-beta
  name                      = "nprod-router-peer2a"
  router                    = google_compute_router.nprod_router_2.name
  region                    = "us-east4"
  peer_ip_address           = "169.254.12.25"
  peer_asn                  = "64700"
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.nprod_router_interface2a.name
}

resource "google_compute_router_interface" "nprod_router_interface2b" {
  project    = "${var.network_proj_id}"
  provider   = google-beta
  name       = "nprod-router-interface2b"
  router     = google_compute_router.nprod_router_2.name
  region     = "us-east4"
  ip_range   = "169.254.12.30/30"
  vpn_tunnel = google_compute_vpn_tunnel.tunnel2b.name
}

resource "google_compute_router_peer" "nprod_router_peer2b" {
  project                   = "${var.network_proj_id}"
  provider                  = google-beta
  name                      = "nprod-router1-peer2b"
  router                    = google_compute_router.nprod_router_2.name
  region                    = "us-east4"
  peer_ip_address           = "169.254.12.29"
  peer_asn                  = "64700"
  advertised_route_priority = 100
  interface                 = google_compute_router_interface.nprod_router_interface2b.name
}