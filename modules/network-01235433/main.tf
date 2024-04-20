resource "azurerm_virtual_network" "n01235433-VNET" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = var.vnet_space
  tags                = local.common_tags
}
resource "azurerm_subnet" "n01235433-SUBNET" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.n01235433-VNET.name
  address_prefixes     = var.subnet_space
}
resource "azurerm_network_security_group" "n01235433-NSG" {
  name                = var.nsg_name
  resource_group_name = var.rg_name
  location            = var.location
  tags                = local.common_tags
  security_rule {
    name                       = "rule1-5433"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule2-5433"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule3-5433"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "rule4-5433"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "n01235433-ASSOC" {
  subnet_id                 = azurerm_subnet.n01235433-SUBNET.id
  network_security_group_id = azurerm_network_security_group.n01235433-NSG.id
}