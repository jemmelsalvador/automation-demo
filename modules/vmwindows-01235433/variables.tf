locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Project"
    Name           = "Jemmel.Salvador"
    ExpirationDate = "2024-12-31"
    Environment    = "Project"
  }
}
variable "nb_count" {}
variable "rg_name" {}
variable "location" {}
variable "avs_win" {}
variable "size_win" {}
variable "vm_win_name" {}
variable "os_disk_attr_win" {
  type = map(string)
}
variable "os_info_win" {
  type = map(string)
}
variable "storage_acct_uri" {}
variable "am_pub" {}
variable "am_type" {}
variable "am_type_hand" {}
variable "subnet_id" {}