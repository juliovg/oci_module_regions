locals {
  json_data = jsondecode(file("${path.module}/init_values.json"))
}

variable "compartment_name" {
  default = "Julio_Vasquez"
}

variable "region1" {
  default = "eu-amsterdam-1"
}