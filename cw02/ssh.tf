resource "digitalocean_ssh_key" "cw2_ssh_key" {
  name = "Szkolenie Key"
  public_key = tls_private_key.cw2_rsa_tz.public_key_openssh
}
resource "tls_private_key" "cw2_rsa_tz" {
  algorithm = "RSA"
  rsa_bits  = 4096
}