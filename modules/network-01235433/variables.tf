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
variable "vnet_name" {}
variable "vnet_space" {}
variable "subnet_name" {}
variable "subnet_space" {}
variable "nsg_name" {}