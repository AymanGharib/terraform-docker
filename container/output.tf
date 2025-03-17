/*output "IPaddresses" {
  value = [for i in docker_container.nodered : join(":", [i.network_data[0].ip_address, i.ports[0].external])]
  description = "List of container IP addresses with ports"
}


output "container_name" {
  value       = docker_container.container_app[*].name
  description = "container"
}

*/

output "application_access" {
  value = { for x in docker_container.container_app[*] : x.name => join("-", x.ports[*]["external"]) }

}