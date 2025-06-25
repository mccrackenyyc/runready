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
}