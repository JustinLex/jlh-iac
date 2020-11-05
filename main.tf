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

resource "proxmox_lxc" "swablu" {
  hostname = "swablu"
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6    = "dhcp"
  }
  ostemplate   = "local:vztmpl/centos-8-default_20191016_amd64.tar.xz"
  password     = "rootroot"
  storage      = "local-zfs"
  unprivileged = true
  target_node  = "pve"
  vmid         = 200
  description  = "Testing terraform"


  #preprovision = true
  #os_type= "centos"
}
