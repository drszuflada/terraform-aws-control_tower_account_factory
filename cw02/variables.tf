variable "do_token" {
  type        = string
  description = "Digital Ocean token"
  sensitive   = true
}
variable "region" {
  type    = string
  default = "fra1"
}
variable "prefix" {
  type    = string
  default = "cw2-tz"
}
variable "vm_size" {
  type    = string
  default = "s-1vcpu-1gb"
}
variable "vm_image" {
  type    = string
  default = "ubuntu-20-04-x64"
}
variable "ip_range" {
  type    = string
  default = "10.19.19.0/24"
}
variable "vm_count" {
  type    = number
  default = 4
}

variable "vms" {
  type = map(object({
    id = string
    name = string
    region = string
    size = string
    image = string
    tags = list(string)
  }))
  default = {
    "vm1" = {
      "id" = "pk1",
      "name" = "cw2-vm",
      "region" = "fra1",
      "image"= "ubuntu-20-04-x64",
      "size" = "s-1vcpu-1gb",
      "tags" = ["cw2", "tz", "development"]
    },
    "vm2" = {
      "id" = "pk2",
      "name" = "cw2-vm2",
      "region" = "fra1",
      "image"=  "ubuntu-22-04-x64",
      "size" = "s-1vcpu-1gb",
      "tags" = ["cw2", "tz", "development"]
    },
  }
}
