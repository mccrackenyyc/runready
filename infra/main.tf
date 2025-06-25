terraform {
  required_version = ">= 1.12"

  backend "azurerm" {
    subscription_id      = "20c17ce1-c880-4374-ab18-0c3a72158cf7"
    resource_group_name  = "rr-rg-statefile"
    storage_account_name = "rrststatefiletl8"
    container_name       = "tfstate"
    key                  = "rr.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.34.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.7.2"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id

  features {}
}