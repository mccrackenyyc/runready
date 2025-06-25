# Configuration for main infrastructure backend
output "backend_config" {
  description = "Backend configuration for main Terraform"
  value = {
    resource_group_name  = azurerm_resource_group.tfstate.name
    storage_account_name = azurerm_storage_account.tfstate.name
    container_name       = azurerm_storage_container.tfstate.name
    key                  = "${var.workload}.tfstate"
  }
}