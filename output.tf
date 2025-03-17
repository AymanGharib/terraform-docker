
/*
output "container_names" {
  value       = module.container[*].container_name
  description = "List of container names"
}
 */
output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "container names "
}