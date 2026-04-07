# Generic Input Variables
# Business division
variable "business_division" {
  description = "Business division in the large organisation this infrastructure belongs to"
  type = string
  default = "govcorp"
}

# Environment variable
variable "environment" {
  description = "environment variable used as a prefix"
  type = string
  default = "ppr"
}

# Azure resource group name
variable "resource_group_name" {
  description = "resource group name"
  type = string
  default = "rg01"
}

# Azure resource location
variable "resource_group_location" {
  description = "region in which azure resources to be created"
  type = string
  default = "eastus2"
}