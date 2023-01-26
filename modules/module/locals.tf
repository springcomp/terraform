locals {
  log_enabled = var.log_enabled || (var.environment == "prd")
}