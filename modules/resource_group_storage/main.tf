terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "resource_group_storage" {
  source   = "urapikh/resource_group_storage/azurerm"
  version  = "1.0.0"
  prefix   = "task6"
  location = "West Europe"
}

resource "random_string" "suffix" {
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