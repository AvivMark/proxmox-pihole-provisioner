provider "proxmox" {
  pm_tls_insecure = var.insecure
  pm_api_url = var.proxmox_api_url
  pm_password = var.proxmox_password
  pm_user = var.proxmox_user
}



module "pihole_lxc" {
    source = "./modules/pihole_lxc"
    providers = {
      proxmox = proxmox
    }
    proxmox_api_url = var.proxmox_api_url
    proxmox_user    = var.proxmox_user
    proxmox_password = var.proxmox_password
    insecure        = var.insecure
    
    lxc_template     = var.lxc_template

    os_template     = var.os_template
    bridge          = var.bridge
    nic_name        = var.nic_name
    password        = var.password
    cores           = var.cores
    memory          = var.memory
    rootfs_size     = var.rootfs_size
    lxc_ip          = var.lxc_ip
}