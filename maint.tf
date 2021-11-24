provider "oci" {
  alias             = "home"
  tenancy_ocid      = local.json_data.TERRAFORM_work.tenancy_ocid
  user_ocid         = local.json_data.TERRAFORM_work.user_ocid
  private_key_path  = local.json_data.TERRAFORM_work.private_key_path
  fingerprint       = local.json_data.TERRAFORM_work.fingerprint
  region            = local.json_data.TERRAFORM_work.region
}

provider "oci" {
  alias             = "region1"
  region            = var.region1
  tenancy_ocid      = local.json_data.TERRAFORM_work.tenancy_ocid
  user_ocid         = local.json_data.TERRAFORM_work.user_ocid
  private_key_path  = local.json_data.TERRAFORM_work.private_key_path
  fingerprint       = local.json_data.TERRAFORM_work.fingerprint
}







/*
data "oci_core_vcn" "test_vcn_fra" {
  #Required
  provider = oci.home
  vcn_id = "ocid1.xxxxxxxxXXXXXXxxxxxXXXXXXxxxxxxx"
}

data "oci_core_vcn" "test_vcn_ams" {
  #Required
  provider = oci.region2
  vcn_id = "ocid1.vcn.xxxxxxxxXXXXXXxxxxxXXXXXXxxxxxxx"
}
*/

module "compartment" {
  source            = "./modules/identity"
  compartment_name  = local.json_data.COMPARTMENT.name
  compartment       = local.json_data.COMPARTMENT.julio_vasquez
}

module "vcn" {
  source            = "./modules/vcn"
  //prov              = oci.home
  //tmp_provider      = oci.region2
  providers = {
    //oci = "oci.region2"
    //"oci" : oci.region2
    oci.root = oci.home
    oci.region1 = oci.region1
  }
  number_resources  = local.json_data.VCN.vcn_number

  compartment_id    = module.compartment.compartment_id
  compartment_name  = module.compartment.compartment_name
  vcn_cidr          = local.json_data.VCN.vcn_cidrblock
  resource_name     = local.json_data.VCN.vcn_name
  label_prefix      = local.json_data.ENV.label
  internet_gateway_enabled = local.json_data.VCN.vcn_ig
  nat_gateway_enabled = local.json_data.VCN.vcn_nat

}

/*
module "vcn" {
  source = "./modules/vcn"
  for_each = local.json_data.ENV.vcn_number
  provider = local.js
}
*/
/*
resource "oci_core_vcn" "vcn_fra" {
  #Required
  provider = oci.home
  cidr_block = "10.0.0.0/16"
  compartment_id = local.json_data.Compartment.julio_vasquez
  display_name = "julio_vcn_fra"
}

resource "oci_core_vcn" "vcn_ams" {
  #Required
  provider = oci.region2
  cidr_block = "172.16.0.0/16"
  compartment_id = local.json_data.Compartment.julio_vasquez
  display_name = "julio_vcn_ams"
}
*/