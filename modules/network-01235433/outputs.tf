output "vnet_output" {
  value = azurerm_virtual_network.n01235433-VNET
}
output "subnet_output" {
  value = azurerm_subnet.n01235433-SUBNET
}
output "nsg_output" {
  value = azurerm_network_security_group.n01235433-NSG
}