terraform {
  required_providers {
    proxmox = {
      source  = "registry.example.com/telmate/proxmox"
      version = ">=1.0.0"
    }
  }
  required_version = ">= 0.13"
}

provider "proxmox" {
  pm_api_url      = "https://pve.jlh.name:8006/api2/json"
  pm_user         = "root@pam"
  pm_tls_insecure = true
}

data "local_file" "public_key" {
  filename = "/home/jlh/.ssh/id_rsa.pub"
}

resource "proxmox_lxc" "swablu" {
  target_node     = "pve"
  vmid            = 200
  hostname        = "swablu"
  unprivileged    = true
  ssh_public_keys = data.local_file.public_key.content

  ostemplate = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"

  storage = "local-zfs"

  memory = 2048
  swap   = 0

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6    = "dhcp"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  description = "Testing terraform"
}
