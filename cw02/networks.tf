resource "digitalocean_vpc" "cw2_net_tz" {
  name     = "${var.prefix}-net"
  region   = var.region
  ip_range = var.ip_range
}
