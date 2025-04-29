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
  source   = "Uklonsd/resource_group_storage/azurerm"
  version  = "1.0.0"
  prefix   = "task6"
  location = "West Europe"
}

variable "subscription_id" {
  type        = string
  description = "Ідентифікатор підписки Azure"
}