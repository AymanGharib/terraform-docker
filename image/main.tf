resource "docker_image" "container_image" {
  #name = "nodered/node-red"
  #name = lookup(var.image  , var.env)
  #name = lookup(var.image  , terraform.workspace)
  name = var.image_in
}