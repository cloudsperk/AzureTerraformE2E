output "web_linuxvm_public_ip" {
  value = azurerm_public_ip.web_linuxvm_publicip.ip_address
}

output "web_linuxvm_network_interface_id" {
  value = azurerm_network_interface.web_linuxvm_nic.id
}
output "web_linuxvm_network_interface_private_ip_address" {
  value = azurerm_network_interface.web_linuxvm_nic.private_ip_address
}

output "web_linuxvm_public_ip_address" {
  value = azurerm_linux_virtual_machine.web-linuxvm.public_ip_address
}

output "web_linuxvm_private_ip_address" {
  value = azurerm_linux_virtual_machine.web-linuxvm.private_ip_address
}
output "web_linuxvm_virtual_machine_id" {
  value = azurerm_linux_virtual_machine.web-linuxvm.id
}