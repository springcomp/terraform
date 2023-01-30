terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  valid_subscriptions = ["ec058181-b853-4412-8120-a9da70c98fac"]
}

data "azurerm_subscription" "current" {
  lifecycle {
    postcondition {
      condition     = contains(local.valid_subscriptions, self.subscription_id)
      error_message = "hashicorp/azurerm log provider configuration has invalid subscription ID."
    }
  }
}