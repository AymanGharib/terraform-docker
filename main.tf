

/*resource "docker_image" "nodered" {
name= var.image
}
*/


module "image" {
  source = "./image"
  # image_in = lookup(var.image   , terraform.workspace)
  for_each = local.deployement
  image_in = each.value.image

}
/*
module "influxdb-image" {
  source = "./image"
  image_in = var.image["influxdb"][terraform.workspace]


   
}*/






/*
resource "null_resource" "docker_vol" {
  provisioner "local-exec" {
    command = "mkdir red-volume"
  }
  
}
*/




# Generate a unique random string for each container

module "container" {
  source = "./container"
  # depends_on = [ null_resource.docker_vol ]
  # count = local.container_count
  for_each = local.deployement
  # name_in  = join("-", [each.key, terraform.workspace,random_string.random[each.key].result])
  name_in = each.key
  #image = docker_image.nodered.image_id
  image_in      = module.image[each.key].image_out
  port_internal = each.value.int
  #external = var.external_port  + count.index
  #external = lookup(var.external_port, var.env)[count.index]
  #external = lookup(var.external_port, terraform.workspace)[count.index]
  port_external = each.value.ext
 
 
       #container_path_in = each.value.container_path
volumes_in = each.value.volumes
  count_in   = each.value.container_count

  #host_path_in = "${path.cwd}/red-vol"


}

# Output container IPs and names
