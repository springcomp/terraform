terraform {
	required_providers {
		azurerm = { source = "hashicorp/azurerm" }
	}
}

## resource "azurerm_resource_group" "module" {
## 	name     = "rg-module"
## 	location = "West Europe"
##   provider = azurerm.az
## }

## module "submodule" {
## 	source = "C:\\Projects\\tf\\modules\\submodule"
## }