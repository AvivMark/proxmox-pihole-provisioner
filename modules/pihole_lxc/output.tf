output "pihole_lxc_id" {
  value = proxmox_lxc.lxc-pihole.id
}

output "lxc_ip" {
  value = proxmox_lxc.lxc-pihole.network[0].ip
}

output lxc_node{
  value = proxmox_lxc.lxc-pihole.target_node
}