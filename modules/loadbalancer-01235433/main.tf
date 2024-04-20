resource "azurerm_public_ip" "n01235433-PIPLB" {
  name                = "n01235433-PIPLB"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = var.dns_label
  tags                = local.common_tags
}
resource "azurerm_lb" "n01235433-LB" {
  name                = "n01235433-LB"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = local.common_tags
  frontend_ip_configuration {
    name                 = "n01235433-LBIPCONFIG"
    public_ip_address_id = azurerm_public_ip.n01235433-PIPLB.id
  }
}
resource "azurerm_lb_backend_address_pool" "n01235433-LBBE" {
  name            = "n01235433-LBBE"
  loadbalancer_id = azurerm_lb.n01235433-LB.id
}
resource "azurerm_network_interface_backend_address_pool_association" "n01235433-LBASSOC" {
  for_each                = var.vm_linux_nic_ids
  network_interface_id    = each.value
  ip_configuration_name   = "${each.key}-ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.n01235433-LBBE.id
}
resource "azurerm_lb_probe" "n01235433-LBPROBE" {
  loadbalancer_id = azurerm_lb.n01235433-LB.id
  name            = "n01235433-LBPROBE"
  port            = 80
}
resource "azurerm_lb_rule" "n01235433-LBRULE" {
  loadbalancer_id                = azurerm_lb.n01235433-LB.id
  name                           = "n01235433-LBRULE"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.n01235433-LB.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.n01235433-LBBE.id]
  probe_id                       = azurerm_lb_probe.n01235433-LBPROBE.id
}