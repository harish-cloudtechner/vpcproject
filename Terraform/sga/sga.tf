resource "azurerm_nat_gateway" "nat" {
  name                = "${var.project}-natgateway"
  location            = "${var.location}"
  resource_group_name = "${var.resource}"
}
resource "azurerm_subnet_network_security_group_association" "sga1" {
  subnet_id                 = "${var.mansubnet}"
  network_security_group_id = "${var.msg_id}"
}
resource "azurerm_subnet_network_security_group_association" "sga2" {
  subnet_id                 = "${var.subnet}"
  network_security_group_id = "${var.websg}"
}
resource "azurerm_subnet_network_security_group_association" "sga3" {
  subnet_id                 = "${var.appsubnet}"
  network_security_group_id = "${var.appsg}"
}
resource "azurerm_subnet_network_security_group_association" "sga4" {
  subnet_id                 = "${var.dbsubnet}"
  network_security_group_id = "${var.dbsg}"
}
resource "azurerm_subnet_nat_gateway_association" "a1" {
  subnet_id      = "${var.appsubnet}"
  nat_gateway_id = azurerm_nat_gateway.nat.id
}
resource "azurerm_subnet_nat_gateway_association" "a2" {
  subnet_id      = "${var.dbsubnet}"
  nat_gateway_id = azurerm_nat_gateway.nat.id
}
