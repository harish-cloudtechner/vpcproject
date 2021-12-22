output "azurerm_network_security_group"{
    value = azurerm_network_security_group.manage-sg.id
}
output "azurerm_network_security_group-web"{
    value = azurerm_network_security_group.web-sg.id
}
output "azurerm_network_security_group-app"{
    value = azurerm_network_security_group.app-sg.id
}
output "azurerm_network_security_group-db"{
    value = azurerm_network_security_group.db-sg.id
}