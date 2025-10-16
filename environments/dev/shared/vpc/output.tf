output "vpc_name" {
  value = google_compute_network.custom_vpc.name
}

output "self_link" {
  value = google_compute_subnetwork.custom_subnet.self_link
}


# # VPC Private Subnets
# output "private_subnets" {
#   description = "A list of private subnets inside the VPC"
#   value       = module.vpc_main.private_subnets
# }
#
# # VPC Public Subnets
# output "public_subnets" {
#   description = "A list of public subnets inside the VPC"
#   value       = module.vpc_main.public_subnets
# }
#
# # VPC Database Subnets
# output "database_subnets" {
#   description = "A list of database subnets inside the VPC"
#   value       = module.vpc_main.database_subnets
# }
#
# # VPC AZs
# output "azs" {
#   description = "A list of availability zones specified as argument to this module"
#   value       = module.vpc_main.azs
# }
#
# # VPC ID
# output "vpc_id" {
#   description = "VPC ID"
#   value       = module.vpc_main.vpc_id
# }
#
#
# # VPC CIDR BLOCK
# output "vpc_cidr_block" {
#   description = "VPC CIDR Block"
#   value       = module.vpc_main.vpc_cidr_block
# }
#
# # Database subnet group name
# output "database_subnet_group_name" {
#   description = "Name of database subnet group"
#   value       = module.vpc_main.database_subnet_group_name
# }
#
# # output "vpc_resource_level_tags" {
# #   value = module.vpc_main.tags
# # }
# #
# # output "vpc_all_tags" {
# #   value = module.vpc_main.tags_all
# # }
