env = "prd"

# Network Configuration  
vnet_address_space = ["10.200.0.0/16"]

subnets = {
  app = {
    address_prefixes = ["10.200.1.0/24"]
  }
  data = {
    address_prefixes  = ["10.200.2.0/24"]
    service_endpoints = ["Microsoft.Storage", "Microsoft.Sql"]
  }
}