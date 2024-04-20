output "avs_win_output" {
  value = azurerm_availability_set.n01235433-AVSWIN
}
output "vm_win_hostname_output" {
  value = [azurerm_windows_virtual_machine.n01235433-VMWIN[*].computer_name]
}
output "vm_win_fqdn_output" {
  value = [azurerm_public_ip.n01235433-PIPWIN[*].fqdn]
}
output "vm_win_private_ip_output" {
  value = [azurerm_windows_virtual_machine.n01235433-VMWIN[*].private_ip_address]
}
output "vm_win_public_ip_output" {
  value = [azurerm_windows_virtual_machine.n01235433-VMWIN[*].public_ip_address]
}
output "vm_win_ids_output" {
  value = { for k, vm in azurerm_windows_virtual_machine.n01235433-VMWIN : "${var.vm_win_name}${k + 1}" => vm.id }
}