locals {
  cw2_fw_rules = [
    {
      protocol = "tcp"
      port_range = "80"
      source_addresses = ["0.0.0.0/0"]
    },
    {
      protocol = "tcp"
      port_range = "443"
      source_addresses = ["0.0.0.0/0"]
    },
    {
      protocol = "tcp"
      port_range = "22"
      source_addresses = ["46.151.137.155/32"]
    }    
 ]
}

locals {
  cw2_fw_rules_out = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },

    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    }
  ]
}