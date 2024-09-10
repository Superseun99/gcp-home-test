module "network" {
  source  = "./modules/network"
  network_name = "my-test"
  region = "us-east1"
  subnet_name = "sub-1"
  project_id ="codematic-external-sandbox"
 

}
module "gce" {
  source = "./modules/gce"
   network_name =  module.network.network-name
   subnet_name = module.network.subnet_names[0]
  machine_type = "e2-medium"
  zone = "us-east1-c"
}
