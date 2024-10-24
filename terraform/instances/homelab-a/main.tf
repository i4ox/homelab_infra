locals {
  name = "homelab-a"
}

module "server" {
  source = "../../shared/providers/proxmox"
  
  name        = local.name
  target_node = var.target_node

  cpu = var.cpu
  ram = var.ram
}

module "nixos" {
  source = "../../shared/nixos"

  configuration_name = local.name

  instance_id = module.server.id
  generation  = var.generation

  initial_ssh_port = module.server.ssh_port
  initial_ssh_user = module.server.ssh_user

  ssh_host = module.server.ssh_host
  ssh_port = var.ssh_port
  ssh_user = var.ssh_user
}
