output "azurerm_resource_group" {
value       = azurerm_resource_group.rg.name
}
output "azurerm_resource_group-loc" {
value       = azurerm_resource_group.rg.location
}
output "azurerm_subnet" {
value       = azurerm_subnet.websubnet.id
}
output "azurerm_subnet-manage" {
value       = azurerm_subnet.managsubnet.id
}
output "azurerm_subnet-app" {
value       = azurerm_subnet.appsubnet.id
}
output "azurerm_subnet-db" {
value       = azurerm_subnet.dbsubnet.id
}
#output "azurerm_subnet_websubnet" {
#value       = azurerm_subnet.websubnet.private_ip_address
#}
#output "azurerm_subnet_appsubnet" {
#value       = azurerm_subnet.appsubnet.private_ip_address
#}
#output "azurerm_subnet_managesubnet" {
#value       = azurerm_subnet.managsubnet.private_ip_address
#}
#output "azurerm_subnet_dbsubnet" {
#value       = azurerm_subnet.dbsubnet.private_ip_address
#}

