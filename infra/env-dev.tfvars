env = "dev"

# Network Configuration
vnet_address_space = ["10.100.0.0/16"]

subnets = {
  app = {
    address_prefixes = ["10.100.1.0/24"]
  }
  data = {
    address_prefixes  = ["10.100.2.0/24"]
    service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]
  }
}