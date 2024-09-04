output "network-name" {
  description = "The name of the VPC network"
  value       = module.network.network_name
}

output "subnet_names" {
  description = "List of subnet names created in the VPC"
  value       = [for subnet in module.network.subnets : subnet.name]
}



