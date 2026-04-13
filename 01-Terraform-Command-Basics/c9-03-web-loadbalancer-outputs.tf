output "web_lb_public_ip_address" {
  value = azurerm_public_ip.web_lbpublicip.ip_address
  description = "Web load balancer public ip address"
}

output "web_lb_id" {
  value = azurerm_lb.web_lb.id
  description = "Web load balancer ID"
}

output "web_lb_frontend_ip_configuration" {
  value = [azurerm_lb.web_lb.frontend_ip_configuration]
  description = "web lb frontend ip configuration block"
}