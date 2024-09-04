# terraform-modules/gcp-vpc/variables.tf




variable "region" {
  description = "The region to deploy  the resources in"
  type        = string
 default = "us-east1"
}

variable "project_id"{
    description = "The project id "
    type        = string
    default = "super-sandbox-434412"
}
