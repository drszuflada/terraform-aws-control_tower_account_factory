resource "digitalocean_project" "cw2_tz" {
  name        = "${var.prefix}-cw2-project"
  description = "A project to represent development resources."
  purpose     = "Web Application"
  environment = "Development"
  resources   = [ for element in digitalocean_droplet.cw2_vm_tz : element.urn ]
}

resource "digitalocean_droplet" "cw2_vm_tz" {
  for_each = var.vms

  name       = "${var.prefix}-vm-${each.value.name}"
  image      = each.value.image
  region     = var.region
  size       = var.vm_size
  vpc_uuid   = digitalocean_vpc.cw2_net_tz.id
  depends_on = [null_resource.fix_vpc_destroy]
  ssh_keys = [digitalocean_ssh_key.cw2_ssh_key.id]
  user_data = <<-XXX
  #cloud-config

  packages:
    - nginx

  apt_update: true

  package_update: true
  package_upgrade: true

  runcmd:
    - apt-get install -y nginx
    - cp -f /tmp/index.html /var/www/html/index.html
  XXX

  provisioner "local-exec" {
    command = "echo ${self.ipv4_address} > ./${self.name}.txt"
  }

  provisioner "file" {
    source = "${path.cwd}/_files/index.html"
    destination = "/tmp/index.html"

    connection {
      type = "ssh"
      user = "root"
      private_key = tls_private_key.cw2_rsa_tz.private_key_pem
      host = self.ipv4_address
    }
  }

}

resource "null_resource" "fix_vpc_destroy" {
  provisioner "local-exec" {
    when    = destroy
    command = "sleep 7"
  }
  depends_on = [digitalocean_vpc.cw2_net_tz]
}
