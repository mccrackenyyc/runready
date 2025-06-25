# Random hex for unique naming
resource "random_string" "suffix" {
  length  = 3
  upper   = false
  special = false
  numeric = true
}

# Resource group for bootstrapping remote state resources
resource "azurerm_resource_group" "tfstate" {
  name     = "${var.workload}-rg-statefile"
  location = var.location

  tags = local.tags
}

# Storage account for Terraform state
resource "azurerm_storage_account" "tfstate" {
  name                     = "${var.workload}ststatefile${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Security settings
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true # Can restrict later if needed

  tags = local.tags
}

# Container for state files
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}