provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
