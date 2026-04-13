## Resource 1 - Create public IP address for ALB
resource "azurerm_public_ip" "web_lbpublicip" {
  name = "${local.resource_name_prefix}-lbpublicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
}
## Resource 2 - Create Azure standard load balancer
resource "azurerm_lb" "web_lb" {
  name = "${local.resource_name_prefix}-weblb"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"
  frontend_ip_configuration {
    name = "web-lb-public-ip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpublicip.id
  }
}
## Resource 3 - Create LB Backend Pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}
## Resource 4 - Create LB Health Probe
resource "azurerm_lb_probe" "web_lb_probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id
}
## Resource 5 - Create LB Ruls
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name = "web-app1-rule"
  protocol = "Tcp"
  frontend_port = 8080
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  loadbalancer_id = azurerm_lb.web_lb.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
  probe_id = azurerm_lb_probe.web_lb_probe.id
}
## Resource 6 - Associate Network Interface and ALB
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associte" {
  network_interface_id = azurerm_network_interface.web_linuxvm_nic.id
  ip_configuration_name = azurerm_network_interface.web_linuxvm_nic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
}