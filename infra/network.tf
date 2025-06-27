module "network" {
  source = "git::https://github.com/mccrackenyyc/terraform-modules.git//templates/network/vnet-subnet?ref=feature/vnet-subnet-module"

  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location
  vnet_name           = "${var.workload}-${var.env}-vnet-core-${random_string.suffix.result}"
  vnet_address_space  = var.vnet_address_space

  # Transform subnets to include computed names
  subnets = {
    for key, config in var.subnets : key => merge(config, {
      subnet_name = "${var.workload}-${var.env}-snet-${key}-${random_string.suffix.result}"
    })
  }

  tags = local.tags
}