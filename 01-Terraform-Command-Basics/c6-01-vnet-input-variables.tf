variable "vnet_name" {
  description = "virtual network name"
  type = string
  default = "vnet-default"
}

variable "vnet_address_space" {
  description = "virtual network address space"
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

# Web subnet name
variable "web_subnet_name" {
  description = "virtual network web subnet name"
  type = string
  default = "websubnet"
}

# Web subnet address
variable "web_subnet_address" {
  description = "virtual network web subnet address"
  type = list(string)
  default = ["10.0.1.0/24"]
}

# App subnet name
variable "app_subnet_name" {
  description = "virtual network app subnet name"
  type = string
  default = "appsubnet"
}

# App subnet address
variable "app_subnet_address" {
  description = "virtual network app subnet address"
  type = list(string)
  default = ["10.0.11.0/24"]
}

# DB subnet name
variable "db_subnet_name" {
  description = "virtual network db subnet name"
  type = string
  default = "dbsubnet"
}

# Web subnet address
variable "db_subnet_address" {
  description = "virtual network db subnet address"
  type = list(string)
  default = ["10.0.21.0/24"]
}

# Bastion subnet name
variable "bastion_subnet_name" {
  description = "virtual network bastion subnet name"
  type = string
  default = "bastionsubnet"
}

# Bastion subnet address
variable "bastion_subnet_address" {
  description = "virtual network bastion subnet address"
  type = list(string)
  default = ["10.0.100.0/24"]
}