resource "random_string" "prefix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_resource_group" "example" {
  name     = local.name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = local.name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

locals {
  name = "${var.prefix}${random_string.prefix.result}"
}