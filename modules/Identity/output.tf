output "compartment_name" {
  value = oci_identity_compartment.test_compartment.name
}

output "compartment_id" {
  value = oci_identity_compartment.test_compartment.compartment_id
}