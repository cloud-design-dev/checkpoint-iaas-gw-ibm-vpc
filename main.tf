##############################################################################
# Create Security Group
##############################################################################

resource "ibm_is_security_group" "ckp_security_group" {
  name           = var.VNF_Security_Group
  vpc            = data.ibm_is_vpc.cp_vpc.id
  resource_group = data.ibm_resource_group.rg.id
}

#Egress All Ports
resource "ibm_is_security_group_rule" "allow_egress_all" {
  depends_on = [ibm_is_security_group.ckp_security_group]
  group      = ibm_is_security_group.ckp_security_group.id
  direction  = "outbound"
  remote     = "0.0.0.0/0"
}

#Ingress All Ports
resource "ibm_is_security_group_rule" "allow_ingress_all" {
  depends_on = [ibm_is_security_group.ckp_security_group]
  group      = ibm_is_security_group.ckp_security_group.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
}

##############################################################################
# Create Check Point Gateway
##############################################################################

locals {
  image_name = "${var.CP_Version}-${var.CP_Type}"
  image_id = lookup(local.image_map[local.image_name], var.VPC_Region)
}

resource "ibm_is_instance" "cp_gw_vsi" {
  depends_on     = [ibm_is_security_group_rule.allow_ingress_all]
  name           = var.VNF_CP-GW_Instance
  image          = local.image_id
  profile        = data.ibm_is_instance_profile.vnf_profile.name
  resource_group = data.ibm_resource_group.rg.id

  #eth0 - Management Interface
  primary_network_interface {
    name            = "eth0"
    subnet          = data.ibm_is_subnet.cp_subnet0.id
    security_groups = [ibm_is_security_group.ckp_security_group.id]
  }

  #eth1 - External Interface
  network_interfaces {
    name            = "eth1"
    subnet          = data.ibm_is_subnet.cp_subnet1.id
    security_groups = [ibm_is_security_group.ckp_security_group.id]
  }

  #eth2 - Internal Interface
  network_interfaces {
    name            = "eth2"
    subnet          = data.ibm_is_subnet.cp_subnet2.id
    security_groups = [ibm_is_security_group.ckp_security_group.id]
  }

  vpc  = data.ibm_is_vpc.cp_vpc.id
  zone = data.ibm_is_subnet.cp_subnet0.zone
  keys = [data.ibm_is_ssh_key.cp_ssh_pub_key.id]

  #Custom UserData
  user_data = file("user_data")

  timeouts {
    create = "15m"
    delete = "15m"
  }

  provisioner "local-exec" {
    command = "sleep 30"
  }
}
