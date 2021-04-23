output "checkpoint_primary_interface" {
  value = ibm_is_instance.cp_gw_vsi.primary_network_interface[0].id
 }
