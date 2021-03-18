variable "region" {
  description = "AWS region ex. us-west-2"
}
/*
###############################################################################
#################################  Test1  #####################################
###############################################################################
variable "bucket" {
  description = "AWS S3 bucket name"
}
*/
###############################################################################
#################################  Test2  #####################################
###############################################################################
variable "availabilityZone1" {
  description = "availabilityZone1 ex. us-west-2a"
}

variable "availabilityZone2" {
  description = "availabilityZone2 ex. us-west-2b"
}

variable "vpcCIDRblock" {
  description = "vpcCIDRblock"
}

variable "instanceTenancy" {
  description = "instanceTenancy ex. default"
}

variable "dnsSupport" {
  description = "dnsSupport true/false"
}
variable "dnsHostNames" {
  description = "dnsHostNames true/false"
}

variable "subnetCIDRblock1" {
  description = "subnetCIDRblock1"
}

variable "subnetCIDRblock2" {
  description = "subnetCIDRblock2"
}

variable "mapPublicIP" {
  description = "mapPublicIP true/false"
}

variable "public_key_path" {
  description = "Path to public certificate"
}

variable "private_key_path" {
  description = "Path to private certificate"
}
