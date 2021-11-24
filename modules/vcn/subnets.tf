
resource "oci_core_subnet" "subnet_public" {
  count                       = var.internet_gateway_enabled == true ? var.number_resources : 0
  cidr_block                  = cidrsubnet(var.vcn_cidr, var.public_newbits, var.public_netnum)
  compartment_id              = var.compartment_id
  //vcn_id                      = oci_core_vcn.vcn.id
  vcn_id                      = oci_core_vcn.vcn.*.id[count.index]
  display_name                = var.label_prefix == "none" ? format("${local.resource_shortname}%02d public subnet", count.index) : format("${var.label_prefix} ${local.resource_shortname}%02d public subnet", count.index)
  /*
  security_list_ids           = [oci_core_vcn.vcn.*.default_security_list_id[count.index]]
  route_table_id              = oci_core_vcn.vcn.*.default_route_table_id[count.index]
  dhcp_options_id             = oci_core_vcn.vcn.*.default_dhcp_options_id[count.index]
  */
}

resource "oci_core_subnet" "subnet_private" {
  count                       = var.nat_gateway_enabled == true ? var.number_resources : 0
  cidr_block                  = cidrsubnet(var.vcn_cidr, var.private_newbits, var.private_netnum)
  compartment_id              = var.compartment_id
  //vcn_id                      = oci_core_vcn.vcn.id
  vcn_id                      = oci_core_vcn.vcn.*.id[count.index]
  display_name                = var.label_prefix == "none" ? format("${local.resource_shortname}%02d private subnet", count.index) : format("${var.label_prefix} ${local.resource_shortname}%02d private subnet", count.index)
  prohibit_public_ip_on_vnic  = true
  /*
  security_list_ids           = [oci_core_vcn.vcn.*.default_security_list_id[count.index]]
  route_table_id              = oci_core_route_table.private_route_table.*.id[count.index]
  dhcp_options_id             = oci_core_dhcp_options.private_dhcp_option.*.id[count.index]
  */
}
