# terraform-modules/gcp-vpc/variables.tf

variable "network_name" {
  description = "Name of the VPC network"
  type        = string

}

variable "subnet_name" {
  description = "Name of thesubnet network"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "project_id"{
    description = "The project id "
    type        = string
    default = "super-sandbox"
}
