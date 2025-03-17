#variable "env" {
#  type = string
#  description = "env to deploy to"
#  default = "dev"
#}

variable "image" {
  type        = map(any)
  description = "image for the container"
  default = {

    nodered = { dev = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "quay.io/influxdb/influxdb:v2.0.2"
      prod = "quay.io/influxdb/influxdb:v2.0.2"
    }
    grafana = {

      dev  = "grafana/grafana-oss"
      prod = "grafana/grafana-oss"

    }
  }
}


variable "external_port" {
  type = map(any)
  /*validation {
   condition = max(var.external_port["dev"]...) >  0 && min(var.external_port["dev"]...) < 9999
  error_message =  "enter a value bigger than  2000"
 }
#sensitive = true
  validation {
   condition = max(var.external_port["prod"]...) >  0 && min(var.external_port["prod"]...) < 9999
  error_message =  "enter a value bigger than  2000"
 }
 */
}
variable "int_port" {
  type    = number
  default = 1880

}
#variable "container_count" {

#default = 3

#}
/*locals {
 #container_count = length(lookup(var.external_port, var.env))
 container_count = length(lookup(var.external_port,terraform.workspace))

}  */