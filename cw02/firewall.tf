resource "digitalocean_firewall" "cw2_fw_rule_1" {
  name = "only-22"

  droplet_ids = [ for element in digitalocean_droplet.cw2_vm_tz : element.id] 

   dynamic "inbound_rule" {
    for_each = local.cw2_fw_rules

    content {
      protocol = inbound_rule.value.protocol
      port_range = inbound_rule.value.port_range
      source_addresses = inbound_rule.value.source_addresses
    }
  }

}
resource "digitalocean_firewall" "cw2_fw_rule_out" {
  name = "output rules"

  droplet_ids = [ for element in digitalocean_droplet.cw2_vm_tz : element.id] 

   dynamic "outbound_rule" {
    for_each = local.cw2_fw_rules_out

    content {
      protocol = outbound_rule.value.protocol
      port_range = outbound_rule.value.port_range
      destination_addresses = outbound_rule.value.destination_addresses
    }
  }

}