resource "azurerm_network_security_group" "manage-sg" {
  name                = "${var.project}-managesg"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"


  security_rule {
    name                       = "${var.project}-sg1"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,1))}"
    destination_address_prefix = "*"
  }
security_rule {
    name                       = "${var.project}-sg2"
    priority                   = 111
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,2))}"
    destination_address_prefix = "*"
  
  }
security_rule {
    name                       = "${var.project}-sg3"
    priority                   = 112
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,4))}"
    destination_address_prefix = "*"
}
}
resource "azurerm_network_security_group" "web-sg" {
  name                = "${var.project}-websg"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  security_rule {
    name                       = "${var.project}-websg1"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,1))}"
    destination_address_prefix = "*"

  }
  security_rule {
    name                       = "${var.project}-websg2"
    priority                   = 121
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,4))}"
    destination_address_prefix = "*"

  }
  security_rule {
    name                       = "${var.project}-websg3"
    priority                   = 122
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }
}
resource "azurerm_network_security_group" "app-sg" {
  name                = "${var.project}-appsg"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  security_rule {
    name                       = "${var.project}-appsg1"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${(cidrsubnet(var.vnet-cidr,4,4))}"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "db-sg" {
  name                = "${var.project}-dbsg"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"

  security_rule {
    name                       = "${var.project}-sg1"
    priority                   = 140
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}