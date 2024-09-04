module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.1.0"
  # insert the 3 required variables here
  network_name = var.network_name
  project_id =  var.project_id
  subnets = [
        {
            subnet_name           = var.subnet_name
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = var.region
        }
  ]
  auto_create_subnetworks = false 
  ingress_rules = [
    {
    name                    = "allow-traffic-ssh-tcp"
    description             = null
    direction               = "INGRESS"
    priority                = null
    destination_ranges      = ["10.0.0.0/8"]
    source_ranges           = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22", "80","443"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
