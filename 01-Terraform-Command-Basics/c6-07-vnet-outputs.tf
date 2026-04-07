# Virtual Network Outputs
output "virtual_network_name" {
  description = "Virtual Network name"
  value = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
  description = "Virtual Network ID"
  value = azurerm_virtual_network.vnet.id
}