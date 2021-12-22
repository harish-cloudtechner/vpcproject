
resource "azurerm_public_ip" "PIP" {
  name                = "PublicIPForLB"
  location            = "West US"
  resource_group_name = "${var.resource}"
  allocation_method   = "Static"
}
resource "azurerm_lb" "lb" {
  name                = "${var.project}_LB"
  location            = "West US"
  resource_group_name = "${var.resource}"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.PIP.id
  }
}
resource "azurerm_lb_rule" "example" {
  resource_group_name            = "${var.resource}"
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "${var.project}-LBRule"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  enable_floating_ip             = false
  backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.lb_probe.id
  depends_on                     = [azurerm_lb_probe.lb_probe]
  }
resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = "${var.resource}"
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "${var.project}_BEAP"
}
resource "azurerm_availability_set" "avset" {
 name                         = "${var.project}_avset"
 location                     = "${var.location}"
 resource_group_name          = "${var.resource}"
 platform_fault_domain_count  = 2
 platform_update_domain_count = 2
 managed                      = true
}
resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = "${var.resource}"
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "${var.project}_probe"
  protocol            = "tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}
resource "azurerm_network_interface_backend_address_pool_association" "example" {
  network_interface_id    = "${var.nic}"
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}
resource "azurerm_network_interface_backend_address_pool_association" "exampleapp" {
  network_interface_id    = "${var.nic3}"
  ip_configuration_name   = "testconfiguration2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
}
#resource "azurerm_network_interface_backend_address_pool_association" "exampledb" {
 # network_interface_id    = "${var.nic4}"
  #ip_configuration_name   = "testconfiguration3"
  #backend_address_pool_id = azurerm_lb_backend_address_pool.bpepool.id
#}