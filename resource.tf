resource "azurerm_resource_group" "rg-dev" {
  name = "rg-dev1"
  location = "east US" 
  }
 resource "azurerm_virtual_network" "publicip" {
  name                = "pubip"
  resource_group_name = "rg-dev1"
  location            = "east US"
  address_space       = ["10.0.0.0/16"]
}
  resource "azurerm_public_ip" "ip" {
  name                = "ip1"
  resource_group_name = "rg-dev1"
  location            = "eastus"
  allocation_method   = "Static"

  }
  resource "azurerm_storage_account" "stg" {
  name                     = "stg5"
  resource_group_name      = azurerm_resource_group.rg-dev.name
  location                 = azurerm_resource_group.rg-dev.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  }