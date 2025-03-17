resource "random_string" "random" {
  #count   = local.container_count
  #for_each = local.deployement
  count   = var.count_in
  length  = 6
  special = false
}



resource "docker_container" "container_app" {

  count = var.count_in
  name  = join("-", [var.name_in, terraform.workspace, random_string.random[count.index].result])
  #image = docker_image.nodered.image_id
  image = var.image_in

  ports {
    internal = var.port_internal
    #external = var.external_port  + count.index
    #external = lookup(var.external_port, var.env)[count.index]
    #external = lookup(var.external_port, terraform.workspace)[count.index]
    external = var.port_external[count.index]
  }
  dynamic "volumes" {

    for_each = var.volumes_in
    content {
      container_path = volumes.value["container_path_each"]
      #host_path = var.host_path_in 
      # volume_name = "${var.name_in}-volume"
      #volume_name = docker_volume.container_volume[volumes.key].name
      volume_name = module.volume[count.index].volumes_output[volumes.key]



    }

  }

  provisioner "local-exec" {
    when    = create
    command = "echo ${self.name}   >> container.txt"
  }
}


module "volume" {
  source = "./volume"
  count = var.count_in
  volume_count = length(var.volumes_in)
  volume_name = "${var.name_in}-${random_string.random[count.index].result}"
  
}