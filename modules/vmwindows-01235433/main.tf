resource "azurerm_network_interface" "n01235433-NICWIN" {
  count               = var.nb_count
  name                = "${var.vm_win_name}${format("%1d", count.index + 1)}-nic"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = local.common_tags
  ip_configuration {
    name                          = "${var.vm_win_name}${format("%1d", count.index + 1)}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.n01235433-PIPWIN[*].id, count.index + 1)
  }
}
resource "azurerm_public_ip" "n01235433-PIPWIN" {
  count               = var.nb_count
  name                = "${var.vm_win_name}${format("%1d", count.index + 1)}-pip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.vm_win_name}${format("%1d", count.index + 1)}"
  tags                = local.common_tags
}
resource "azurerm_windows_virtual_machine" "n01235433-VMWIN" {
  count               = var.nb_count
  name                = "${var.vm_win_name}${format("%1d", count.index + 1)}"
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.size_win
  admin_username      = "n01235433"
  admin_password      = "P@$$w0rd123!"
  availability_set_id = azurerm_availability_set.n01235433-AVSWIN.id
  tags                = local.common_tags
  network_interface_ids = [
    element(azurerm_network_interface.n01235433-NICWIN[*].id, count.index + 1)
  ]
  os_disk {
    name                 = "${var.vm_win_name}${format("%1d", count.index + 1)}-disk"
    disk_size_gb         = var.os_disk_attr_win.disk_size
    caching              = var.os_disk_attr_win.caching
    storage_account_type = var.os_disk_attr_win.storage_acct_type
  }
  source_image_reference {
    publisher = var.os_info_win.publisher
    offer     = var.os_info_win.offer
    sku       = var.os_info_win.sku
    version   = var.os_info_win.version
  }
  boot_diagnostics {
    storage_account_uri = var.storage_acct_uri
  }
}
resource "azurerm_virtual_machine_extension" "n01235433-AM" {
  count                = var.nb_count
  name                 = "${var.vm_win_name}${format("%1d", count.index + 1)}-AM"
  publisher            = var.am_pub
  type                 = var.am_type
  type_handler_version = var.am_type_hand
  virtual_machine_id   = element(azurerm_windows_virtual_machine.n01235433-VMWIN[*].id, count.index + 1)
  tags                 = local.common_tags
}
resource "azurerm_availability_set" "n01235433-AVSWIN" {
  name                         = var.avs_win
  resource_group_name          = var.rg_name
  location                     = var.location
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "2"
  tags                         = local.common_tags
}