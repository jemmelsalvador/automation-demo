resource "azurerm_postgresql_server" "n01235433-PGSQLSERVER" {
  name                         = "n01235433-pgsqlserver"
  resource_group_name          = var.rg_name
  location                     = var.location
  sku_name                     = var.db_sku_name
  storage_mb                   = var.db_storage_mb
  version                      = var.db_version
  ssl_enforcement_enabled      = var.db_ssl_enforcement_enabled
  administrator_login          = var.db_admin_login
  administrator_login_password = var.db_admin_pw
  tags                         = local.common_tags
}
resource "azurerm_postgresql_database" "n01235433-PGSQLDB" {
  name                = "n01235433-PGSQLDB"
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.n01235433-PGSQLSERVER.name
  charset             = var.db_charset
  collation           = var.db_collation
  # prevent the possibility of accidental data loss
  #lifecycle {
  #  prevent_destroy = true
  #}
}