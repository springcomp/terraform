locals {
	azurerm_logmanagement_subscription_id = "ec058181-b853-4412-8120-a9da70c98fac"
	azurerm_logmanagement_tenant_id = "e6cbec2f-2f23-43ca-82c4-51a7c9b71e7a"
}

provider "azurerm" {
    features            {}
	alias               = "log"
    subscription_id     = local.azurerm_logmanagement_subscription_id
    tenant_id           = local.azurerm_logmanagement_tenant_id
}