resource "azurerm_public_ip" "public_ip" {
 name                         = "${var.project}-PIP"
 location                     = "${var.location}"
 resource_group_name          = "${var.resource}"
 allocation_method            = "Dynamic"
}
resource "azurerm_public_ip" "public_ip1" {
 name                         = "${var.project}-PIP2"
 location                     = "${var.location}"
 resource_group_name          = "${var.resource}"
 allocation_method            = "Dynamic"
}
resource "azurerm_network_interface" "nic" {
  name                = "${var.project}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${var.subnet}"
    #public_ip_address_id = azurerm_public_ip.public_ip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "${var.project}-nic2"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = "${var.mansubnet}"
    public_ip_address_id = azurerm_public_ip.public_ip1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface" "nic3" {
  name                = "${var.project}-nic3"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = "${var.appsubnet}"
    #public_ip_address_id = azurerm_public_ip.public_ip1.id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface" "nic4" {
  name                = "${var.project}-nic4"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  ip_configuration {
    name                          = "testconfiguration3"
    subnet_id                     = "${var.dbsubnet}"
    #public_ip_address_id = azurerm_public_ip.public_ip1.id
    private_ip_address_allocation = "Dynamic"
  }
}