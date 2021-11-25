/*
resource "oci_core_vcn" "vcn_fra" {
  #Required
  provider = oci.home
  cidr_block = "10.0.0.0/16"
  compartment_id = local.json_data.Compartment.julio_vasquez
  display_name = "julio_vcn_fra"
}
*/

terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
      version = ">= 1.0.2"
      configuration_aliases = [ oci.src, oci.dst ]
    }
  }
}

resource "oci_core_vcn" "vcn" {
  #Required
  //provider        = var.oci
  count           = var.number_resources

  cidr_block      = var.vcn_cidr //"10.0.0.0/16"
  compartment_id  = var.compartment_id // local.json_data.Compartment.julio_vasquez
  //display_name    = var.label_prefix == "none" ? var.vcn_name : "${var.label_prefix}-${var.vcn_name}" // "julio_vcn_fra"
  display_name    = var.label_prefix == "none" ? format("${local.resource_shortname}%02d", count.index) : format("${var.label_prefix} ${local.resource_shortname}%02d", count.index)

}