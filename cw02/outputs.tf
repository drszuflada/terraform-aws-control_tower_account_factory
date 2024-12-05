output "token" {
  value     = var.do_token
  sensitive = true
}

output "cw2_vm_id" {
  value = digitalocean_droplet.cw2_vm_tz.*.id
}

