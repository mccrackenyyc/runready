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