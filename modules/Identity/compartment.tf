/*
provider "oci" {
  tenancy_ocid      = local.json_data.TERRAFORM_work.tenancy_ocid
  user_ocid         = local.json_data.TERRAFORM_work.user_ocid
  private_key_path  = local.json_data.TERRAFORM_work.private_key_path
  fingerprint       = local.json_data.TERRAFORM_work.fingerprint
  region            = local.json_data.TERRAFORM_work.region
}

resource "oci_identity_compartment" "test_compartment" {
  #Required
  compartment_id  = local.json_data.COMPARTMENT.julio_vasquez
  description     = "Compartment for Hub and Spoke"
  name            = local.json_data.COMPARTMENT.name
  enable_delete   = true
}
*/

resource "oci_identity_compartment" "test_compartment" {
  #Required
  compartment_id  = var.compartment
  description     = "Compartment for Hub and Spoke"
  name            = var.compartment_name
  enable_delete   = true
}
