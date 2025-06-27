locals {
  tags = {
    workload    = var.workload_name
    environment = var.env
    managed_by  = "terraform"
  }
}

# locals {
#   subnets_config = {
#     "app" = {
#       subnet_name      = "${var.workload}-${var.env}-snet-app-${random_string.suffix.result}"
#       address_prefixes = var.app_subnet_prefixes
#     }
#     "data" = {
#       subnet_name       = "${var.workload}-${var.env}-snet-data-${random_string.suffix.result}"
#       address_prefixes  = var.data_subnet_prefixes
#       service_endpoints = var.data_subnet_service_endpoints
#     }
#   }
# }

# locals {
#   vnet_core = {
#     name = "${var.workload}-${var.env}-vnet-core-${random_string.suffix.result}"
#     address_space = var.vnet_address_space
#     subnet_configs = {
#       app config = {

#       }
#       data_config = {
#         name
#         service endpoints = [service1, service2]
#       }
#       third_subnet
#     }

#   }
# }