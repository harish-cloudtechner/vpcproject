# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}_RG"
  location = "westus"
}
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.vnet-cidr]
}
resource "azurerm_subnet" "appsubnet" {
  name                 = "${var.project_name}-appsub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [(cidrsubnet(var.vnet-cidr,4,1))]
 
}

resource "azurerm_subnet" "websubnet" {
  name                 = "${var.project_name}-websub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [(cidrsubnet(var.vnet-cidr,4,2))]
 
}
resource "azurerm_subnet" "managsubnet" {
  name                 = "${var.project_name}-managsub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [(cidrsubnet(var.vnet-cidr,4,3))]

}
resource "azurerm_subnet" "dbsubnet" {
  name                 = "${var.project_name}-dbsub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [(cidrsubnet(var.vnet-cidr,4,4))]
 }
 

