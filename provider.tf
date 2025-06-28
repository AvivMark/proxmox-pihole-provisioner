terraform {
    required_version = ">= 1.12"

    required_providers {
        version = "= 1.12"
        proxmox = {
            source = "telmate/proxmox"
            version = "= 2.9.11"
        }
    }
}