variable "proxmox_api_url" {
  type        = string
  description = "The URL of the Proxmox API endpoint."
}

variable "proxmox_user" {
  type        = string
  description = "The Proxmox user to authenticate with."
}

variable "proxmox_password" {
  type        = string
  description = "The password for the Proxmox user."
  sensitive   = true
}

variable "insecure" {
  type        = bool
  description = "Whether to skip SSL verification when connecting to Proxmox."
  default     = false
}

variable "lxc_template" {
  type = object({
    name = string
    node = string
    pool = string
  })
  description = "Object describing the LXC container template and configuration."
  default = {
    name = "lxc_new"
    node = "node"
    pool = "pool"
  }
}

variable "os_template" {
  type        = string
  description = "The OS template to use for the LXC container."
  default     = "local:vztmpl/almalinux-9-default_20240911_amd64.tar.xz"
}

variable "bridge" {
  type        = string
  description = "The network bridge to attach the LXC container to."
  default     = "vmbr0"
}

variable "nic_name" {
  type        = string
  description = "The network interface name for the LXC container."
  default     = "eth0"
}

variable "password" {
  type        = string
  description = "The root password for the LXC container."
  default     = "changeme"
}

variable "cores" {
  type        = number
  description = "Number of CPU cores to allocate to the LXC container."
  default     = 2
}

variable "memory" {
  type        = number
  description = "Amount of memory (in MB) to allocate to the LXC container."
  default     = 2048
}

variable "rootfs_size" {
  type        = string
  description = "Size of the root filesystem for the LXC container."
  default     = "32G"
}

variable "lxc_ip" {
  type        = string
  description = "IP address to assign to the LXC container (default is DHCP, for static ip use - X.X.X.X/subnet)."
  default     = "dhcp"
}