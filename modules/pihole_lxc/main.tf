
resource "proxmox_lxc" "lxc-pihole" {
    features {
        nesting = true
    }
    hostname = var.lxc_template.name
    pool         = var.lxc_template.pool
    target_node  = var.lxc_template.node
    network {
        name   = var.nic_name
        bridge = var.bridge
        ip     = var.lxc_ip
        ip6    = "dhcp"
    }
    rootfs {
      storage = "bigData"
      size    = var.rootfs_size
    }
    cores        = var.cores
    memory       = var.memory
    start        = true
    unprivileged = false
    ostemplate   = var.os_template
    password     = var.password
    tags = "pihole,terraform"
}

resource "null_resource" "post_create_commands" {
  depends_on = [proxmox_lxc.lxc-pihole]

  provisioner "local-exec" {
    command = <<EOT
    echo "LXC container created: ${proxmox_lxc.lxc-pihole.hostname}"
    ssh root@${proxmox_lxc.lxc-pihole.network[0].ip} "apt update && apt install -y curl"
    EOT
  }
}
