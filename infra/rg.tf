# Random suffix for resource naming
resource "random_string" "suffix" {
  length  = 3
  upper   = false
  special = false
  numeric = true
}

# Main resource group for all environment resources
resource "azurerm_resource_group" "main" {
  name     = "${var.workload}-${var.env}-rg-core"
  location = var.location

  tags = local.tags
}