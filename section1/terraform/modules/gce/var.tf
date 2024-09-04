# terraform-modules/gcp-vpc/variables.tf

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet network"
  type        = string
}


variable "zone" {
  description = "The region to deploy resources in"
  type        = string
}

variable "name"{
    description = "instance name "
    type        = string
    default = "name"
}
variable "machine_type"{
    description = "type of instance"
    type = string
    default = "e2-medium"
}