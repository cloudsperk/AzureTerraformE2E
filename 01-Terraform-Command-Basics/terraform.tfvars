# Generic input variables
business_division = "lseg"
environment = "ppr"
resource_group_name = "gcrg"
resource_group_location = "eastus2"

# VNET input variables
vnet_name = "vnet"
vnet_address_space = [ "10.0.0.0/16" ]

web_subnet_name = "websubnet"
web_subnet_address = [ "10.0.10.0/24" ]

app_subnet_name = "appsubnet"
app_subnet_address = [ "10.0.11.0/24" ]

db_subnet_name = "dbsubnet"
db_subnet_address = [ "10.0.12.0/24" ]

bastion_subnet_name = "dbsubnet"
bastion_subnet_address = [ "10.0.13.0/24" ]

bastion_service_subnet_name = "AzureBastionSubnet"
bastion_service_address_prefix = [ "10.0.1.0/27" ]