locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Project"
    Name           = "Jemmel.Salvador"
    ExpirationDate = "2024-12-31"
    Environment    = "Project"
  }
}
variable "rg_name" {}
variable "location" {}
variable "avs_linux" {}
variable "size_linux" {}
variable "admin_username_linux" {}
variable "public_key" {}
variable "priv_key" {}
variable "vm_linux_name" {
  type = map(string)
}
variable "os_disk_attr_linux" {
  type = map(string)
}
variable "os_info_linux" {
  type = map(string)
}
variable "storage_acct_uri" {}
variable "nw_pub" {}
variable "nw_type" {}
variable "nw_type_hand" {}
variable "am_pub" {}
variable "am_type" {}
variable "am_type_hand" {}
variable "subnet_id" {}
variable "datadisk_attach" {}