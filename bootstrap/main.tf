terraform {
  required_version = ">= 1.12"

  backend "local" {
    path = "terraform.tfstate"
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