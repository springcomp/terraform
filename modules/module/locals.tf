locals {
  criticity = contains(split(",", "dev,int,uat"), var.environment) ? "npd" : "prd"
  log_enabled = var.log_enabled || (local.criticity == "prd")
}