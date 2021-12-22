output "azurerm_lb" {
value       = azurerm_lb.lb.id
}
output "azurerm_availability_set" {
value       = azurerm_availability_set.avset.id
}
output "PublicIPForLB"{
    value = azurerm_public_ip.PIP.id
}

