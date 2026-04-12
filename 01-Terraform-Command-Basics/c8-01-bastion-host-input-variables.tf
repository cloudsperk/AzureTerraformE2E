variable "bastion_service_subnet_name" {
  type = string
  default = "AzureBastionSubnet"
}

variable "bastion_service_address_prefix" {
  type = list(string)
  default = ["10.0.1.0/27"]
}