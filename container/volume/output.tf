output "volumes_output" {
  value = docker_volume.container_volume[*].name
}