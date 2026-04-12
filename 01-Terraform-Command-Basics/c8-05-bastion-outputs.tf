output "bastion_host_linuxvm_public_ip_address" {
  description = "Bastion Linux VM Public IP address"
  value = azurerm_public_ip.bastion_host_linuxvm_public_ip.ip_address
}