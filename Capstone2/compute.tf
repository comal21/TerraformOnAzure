resource "random_pet" "lb_hostname" {
}

# Create an virtual network and subnet
resource "azurerm_virtual_network" "test" {
  name                = "terraformvnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.test.name
  address_prefixes     = ["10.0.0.0/20"]
}

# network security group for the subnet with a rule to allow http, https and ssh traffic
resource "azurerm_network_security_group" "myNSG" {
  name                = "myNSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
