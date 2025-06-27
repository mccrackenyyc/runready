# ================================
# 📌 Global Variables
# ================================

variable "subscription_id" {
  description = "Azure subscription"
  type        = string
  default     = "20c17ce1-c880-4374-ab18-0c3a72158cf7"
}

variable "workload" {
  description = "The workload identifier"
  type        = string
  default     = "rr"
}

variable "workload_name" {
  description = "The full workload name"
  type        = string
  default     = "RunReady"
}

variable "env" {
  description = "The environment (dev, prd)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "Canada Central"

  validation {
    condition = contains([
      "Canada Central", "Canada East"
    ], var.location)
    error_message = "RunReady only supports Canadian regions: Canada Central, Canada East."
  }
}

# ================================
# 📌 Network Module Variables
# ================================

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "Subnets to create"
  type = map(object({
    address_prefixes                  = list(string)
    private_endpoint_network_policies = optional(string, "Enabled")
    service_endpoints                 = optional(list(string), [])
    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }), null)
  }))
}

# variable "vnet_address_space" {
#   description = "Address space for the virtual network"
#   type        = list(string)
#   default     = ["10.100.0.0/16"]
# }

# variable "app_subnet_prefixes" {
#   description = "Address prefixes for the app subnet"
#   type        = list(string)
#   default     = ["10.100.1.0/24"]
# }

# variable "data_subnet_prefixes" {
#   description = "Address prefixes for the data subnet"
#   type        = list(string)
#   default     = ["10.100.2.0/24"]
# }

# variable "data_subnet_service_endpoints" {
#   description = "Service endpoints for the data subnet"
#   type        = list(string)
#   default     = ["Microsoft.Sql", "Microsoft.Storage"]
# }