resource "azurerm_log_analytics_workspace" "n01235433-LAW" {
  name                = "n01235433-LAW"
  resource_group_name = var.rg_name
  location            = var.location
  tags                = local.common_tags
}
resource "azurerm_recovery_services_vault" "n01235433-RSV" {
  name                = "n01235433-RSV"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.rsv_sku
  tags                = local.common_tags
}
resource "azurerm_storage_account" "n01235433-SA" {
  name                     = "n01235433sa"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.sa_acct_tier
  account_replication_type = var.sa_acct_rep_type
  tags                     = local.common_tags
}