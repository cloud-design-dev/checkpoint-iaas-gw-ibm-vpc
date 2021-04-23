##############################################################################
# Variable block - See each variable description
##############################################################################

variable "VPC_Region" {
  default     = ""
  description = "The region where the VPC, networks, and Check Point VSI will be provisioned."
}

variable "Resource_Group" {
  default     = ""
  description = "The resource group that will be used when provisioning the Check Point VSI. If left unspecififed, the account's default resource group will be used."
}

variable "VPC_Name" {
  default     = ""
  description = "The VPC where the Check Point VSI will be provisioned."
}

variable "Management_Subnet_ID" {
  default     = ""
  description = "The ID of the Check Point management subnet."
}

variable "External_Subnet_ID" {
  default     = ""
  description = "The ID of the subnet that exists in front of the Check Point Security Gateway that will be provisioned (the 'external' network)."
}

variable "Internal_Subnet_ID" {
  default     = ""
  description = "The ID of the subnet that exists behind  the Check Point Security Gateway that will be provisioned (the 'internal' network)."
}

variable "SSH_Key" {
  default     = ""
  description = "The pubic SSH Key that will be used when provisioning the Check Point VSI."
}

variable "VNF_CP-GW_Instance" {
  default     = "checkpoint-gateway"
  description = "The name of the Check Point Security Gatewat that will be provisioned."
}

variable "VNF_Security_Group" {
  default     = ""
  description = "Enter a unique name for the security-group to be applied to Check Point interfaces."
}

variable "VNF_Profile" {
  default     = "cx2-8x16"
  description = "The VNF profile that defines the CPU and memory resources. This will be used when provisioning the Check Point VSI."
}

variable "CP_Version" {
  default     = "R8040"
  description = "The version of Check Point to deploy. R8040, R81"
}

variable "CP_Type" {
  default     = "Gateway"
  description = "(HIDDEN) Gateway or Management"
}

variable "vnf_license" {
  default     = ""
  description = "(HIDDEN) Optional. The BYOL license key that you want your cp virtual server in a VPC to be used by registration flow during cloud-init."
}

variable "ibmcloud_endpoint" {
  default     = "cloud.ibm.com"
  description = "(HIDDEN) The IBM Cloud environmental variable 'cloud.ibm.com' or 'test.cloud.ibm.com'"
}

variable "delete_custom_image_confirmation" {
  default     = ""
  description = "(HIDDEN) This variable is to get the confirmation from customers that they will delete the custom image manually, post successful installation of VNF instances. Customer should enter 'Yes' to proceed further with the installation."
}

variable "ibmcloud_api_key" {
  default     = ""
  description = "(HIDDEN) holds the user api key"
}

variable "TF_VERSION" {
 default = "0.12"
 description = "terraform engine version to be used in schematics"
}
