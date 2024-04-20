output "rg_name_output" {
  value = module.rgroup-01235433.rg_output.name
}
output "vnet_name_output" {
  value = module.network-01235433.vnet_output.name
}
output "vnet_address_space_output" {
  value = module.network-01235433.vnet_output.address_space
}
output "subnet_name_output" {
  value = module.network-01235433.subnet_output.name
}
output "subnet_address_space_output" {
  value = module.network-01235433.subnet_output.address_prefixes
}
output "nsg_name_output" {
  value = module.network-01235433.nsg_output.name
}
output "avs_linux_name_output" {
  value = module.vmlinux-01235433.avs_linux_output.name
}
output "law_name_output" {
  value = module.common-01235433.law_output.name
}
output "rsv_name_output" {
  value = module.common-01235433.rsv_output.name
}
output "sa_name_output" {
  value = module.common-01235433.sa_output.name
}
output "vm_linux_hostnames_output" {
  value = module.vmlinux-01235433.vm_linux_hostname_output
}
output "vm_linux_fqdns_output" {
  value = module.vmlinux-01235433.vm_linux_fqdn_output
}
output "vm_linux_private_ips_output" {
  value = module.vmlinux-01235433.vm_linux_private_ip_output
}
output "vm_linux_public_ips_output" {
  value = module.vmlinux-01235433.vm_linux_public_ip_output
}
output "avs_win_name_output" {
  value = module.vmwindows-01235433.avs_win_output.name
}
output "vm_win_hostnames_output" {
  value = module.vmwindows-01235433.vm_win_hostname_output
}
output "vm_win_fqdns_output" {
  value = module.vmwindows-01235433.vm_win_fqdn_output
}
output "vm_win_private_ips_output" {
  value = module.vmwindows-01235433.vm_win_private_ip_output
}
output "vm_win_public_ips_output" {
  value = module.vmwindows-01235433.vm_win_public_ip_output
}
output "lb_name_output" {
  value = module.loadbalancer-01235433.lb_output.name
}
output "pgsql_name_output" {
  value = module.database-01235433.pgsql_output.name
}