module "rgroup-01235433" {
  source   = "./modules/rgroup-01235433"
  rg_name  = "n01235433-RG"
  location = "canadacentral"
}
module "network-01235433" {
  source       = "./modules/network-01235433"
  rg_name      = module.rgroup-01235433.rg_output.name
  location     = module.rgroup-01235433.rg_output.location
  vnet_name    = "n01235433-VNET"
  vnet_space   = ["10.0.0.0/16"]
  subnet_name  = "n01235433-SUBNET"
  subnet_space = ["10.0.0.0/24"]
  nsg_name     = "n01235433-NSG"
}
module "common-01235433" {
  source           = "./modules/common-01235433"
  rg_name          = module.rgroup-01235433.rg_output.name
  location         = module.rgroup-01235433.rg_output.location
  rsv_sku          = "Standard"
  sa_acct_tier     = "Standard"
  sa_acct_rep_type = "LRS"
}
module "vmlinux-01235433" {
  source               = "./modules/vmlinux-01235433"
  rg_name              = module.rgroup-01235433.rg_output.name
  location             = module.rgroup-01235433.rg_output.location
  avs_linux            = "n01235433-AVSLINUX"
  size_linux           = "Standard_B1ms"
  admin_username_linux = "n01235433"
  public_key = "~/id_rsa.pub"
  priv_key   = "~/id_rsa"
  vm_linux_name = {
    n01235433-l-vm1 = ""
    n01235433-l-vm2 = ""
    n01235433-l-vm3 = ""
  }
  os_disk_attr_linux = {
    storage_acct_type = "Premium_LRS"
    disk_size         = "32"
    caching           = "ReadWrite"
  }
  os_info_linux = {
    publisher = "cognosys"
    offer     = "centos-8-2-free"
    sku       = "centos-8-2-free"
    version   = "latest"
  }
  storage_acct_uri = module.common-01235433.sa_output.primary_blob_endpoint
  nw_pub           = "Microsoft.Azure.NetworkWatcher"
  nw_type          = "NetworkWatcherAgentLinux"
  nw_type_hand     = "1.4"
  am_pub           = "Microsoft.Azure.Monitor"
  am_type          = "AzureMonitorLinuxAgent"
  am_type_hand     = "1.9"
  subnet_id        = module.network-01235433.subnet_output.id
  datadisk_attach  = module.datadisk-01235433.datadisk_attach_output
}
module "vmwindows-01235433" {
  source      = "./modules/vmwindows-01235433"
  nb_count    = "1"
  rg_name     = module.rgroup-01235433.rg_output.name
  location    = module.rgroup-01235433.rg_output.location
  avs_win     = "n01235433-AVSLINUX"
  vm_win_name = "n5433-vmwin"
  size_win    = "Standard_B1ms"
  os_disk_attr_win = {
    storage_acct_type = "Premium_LRS"
    disk_size         = "128"
    caching           = "ReadWrite"
  }
  os_info_win = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  storage_acct_uri = module.common-01235433.sa_output.primary_blob_endpoint
  am_pub           = "Microsoft.Azure.Security"
  am_type          = "IaaSAntimalware"
  am_type_hand     = "1.3"
  subnet_id        = module.network-01235433.subnet_output.id
}
module "datadisk-01235433" {
  source            = "./modules/datadisk-01235433"
  rg_name           = module.rgroup-01235433.rg_output.name
  location          = module.rgroup-01235433.rg_output.location
  vm_linux_ids      = module.vmlinux-01235433.vm_linux_ids_output
  vm_win_ids        = module.vmwindows-01235433.vm_win_ids_output
  storage_acct_type = "Standard_LRS"
  create_opt        = "Empty"
  disk_size_gb      = "10"
  lun               = "10"
  caching           = "ReadWrite"
}
module "loadbalancer-01235433" {
  source           = "./modules/loadbalancer-01235433"
  rg_name          = module.rgroup-01235433.rg_output.name
  location         = module.rgroup-01235433.rg_output.location
  vm_linux_nic_ids = module.vmlinux-01235433.vm_linux_nic_ids_output
  dns_label        = "project5433"
}
module "database-01235433" {
  source                     = "./modules/database-01235433"
  rg_name                    = module.rgroup-01235433.rg_output.name
  location                   = module.rgroup-01235433.rg_output.location
  db_sku_name                = "B_Gen5_1"
  db_storage_mb              = 5120
  db_version                 = "9.5"
  db_ssl_enforcement_enabled = true
  db_charset                 = "UTF8"
  db_collation               = "English_United States.1252"
  db_admin_login             = "humberadmin"
  db_admin_pw                = "P@ssw0rd!"
}