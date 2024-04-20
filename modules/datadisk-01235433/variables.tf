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
variable "vm_linux_ids" {
  type = map(string)
}
variable "vm_win_ids" {
  type = map(string)
}
//variable "vm_win_name" {}
variable "storage_acct_type" {}
variable "create_opt" {}
variable "disk_size_gb" {}
variable "lun" {}
variable "caching" {}