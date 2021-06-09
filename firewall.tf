resource "google_compute_firewall" "main" {
  name    = "${var.prefix}-firewall"
  network = var.vpc


  allow {
    protocol = "tcp"
    ports    = concat(["22", "80", "443", "445", ], var.firewall_ports)
  }

  source_ranges = var.ip_allow_list
}