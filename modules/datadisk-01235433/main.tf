resource "azurerm_managed_disk" "n01235433-AMDLINUX" {
  for_each             = var.vm_linux_ids
  name                 = "${each.key}-datadisk"
  resource_group_name  = var.rg_name
  location             = var.location
  storage_account_type = var.storage_acct_type
  create_option        = var.create_opt
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}
resource "azurerm_managed_disk" "n01235433-AMDWIN" {
  for_each             = var.vm_win_ids
  name                 = "${each.key}-datadisk"
  resource_group_name  = var.rg_name
  location             = var.location
  storage_account_type = var.storage_acct_type
  create_option        = var.create_opt
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}
resource "azurerm_virtual_machine_data_disk_attachment" "n01235433-ATTACHLINUX" {
  for_each           = var.vm_linux_ids
  managed_disk_id    = azurerm_managed_disk.n01235433-AMDLINUX[each.key].id
  virtual_machine_id = each.value
  lun                = var.lun
  caching            = var.caching
}
resource "azurerm_virtual_machine_data_disk_attachment" "n01235433-ATTACHWIN" {
  for_each           = var.vm_win_ids
  managed_disk_id    = azurerm_managed_disk.n01235433-AMDWIN[each.key].id
  virtual_machine_id = each.value
  lun                = var.lun
  caching            = var.caching
}