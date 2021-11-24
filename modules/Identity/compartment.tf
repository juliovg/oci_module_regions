resource "oci_identity_compartment" "test_compartment" {
  #Required
  compartment_id  = var.compartment
  description     = "Compartment for Hub and Spoke"
  name            = var.compartment_name
  enable_delete   = true
}