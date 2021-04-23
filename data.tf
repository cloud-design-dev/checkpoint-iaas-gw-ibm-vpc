##############################################################################
# Data block 
##############################################################################

data "ibm_is_subnet" "cp_subnet0" {
  identifier = var.Management_Subnet_ID
}

data "ibm_is_subnet" "cp_subnet1" {
  identifier = var.External_Subnet_ID
}

data "ibm_is_subnet" "cp_subnet2" {
  identifier = var.Internal_Subnet_ID
}

data "ibm_is_ssh_key" "cp_ssh_pub_key" {
  name = var.SSH_Key
}

data "ibm_is_instance_profile" "vnf_profile" {
  name = var.VNF_Profile
}

data "ibm_is_region" "region" {
  name = var.VPC_Region
}

data "ibm_is_vpc" "cp_vpc" {
  name = var.VPC_Name
}

data "ibm_resource_group" "rg" {
  name = var.Resource_Group
}
