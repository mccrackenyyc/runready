locals {
  tags = {
    workload    = var.workload_name
    environment = var.env
    managed_by  = "terraform"
  }
}