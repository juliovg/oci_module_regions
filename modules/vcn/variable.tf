//variable "oci" {}
variable "vcn_cidr" {}
variable "compartment_id" {}
variable "compartment_name" {}
variable "label_prefix" {}
variable "resource_name" {}
variable "number_resources" {}
locals {
  resource_name       = var.resource_name == "" ? var.compartment_name : var.resource_name
  //resource_name       = var.label_prefix == "" ? var.vcn_name : "${var.label_prefix}-${var.vcn_name}"
  resource_shortname  = lower(replace(local.resource_name, "-", ""))
}

variable "nat_gateway_enabled" {}
variable "internet_gateway_enabled" {}
//variable "vcn_cidr" {}



variable "public_newbits" {
  default   = 8
  type      = number
}
variable "public_netnum" {
  default     = 0
  type        = number
}
variable "private_netnum" {
  default     = 1
  type        = number
}
variable "private_newbits" {
  default     = 8
  type        = number
}
