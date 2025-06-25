locals {
  tags = {
    workload   = var.workload_name
    purpose    = "terraform-state"
    managed_by = "terraform"
  }
}