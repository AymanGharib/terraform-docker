
locals {
  deployement = {
   /* nodered = {
      image           = var.image["nodered"][terraform.workspace]
      int             = 1880
      ext             = var.external_port["nodered"][terraform.workspace]
      container_path  = "/data"
      container_count = length(var.external_port["nodered"][terraform.workspace])
    }
    influxdb = {
      image           = var.image["influxdb"][terraform.workspace]
      int             = 8086
      ext             = var.external_port["influxdb"][terraform.workspace]
      container_path  = "/var/lib/influxdb"
      container_count = length(var.external_port["influxdb"][terraform.workspace])

    } */
    grafana = {
      image = var.image["grafana"][terraform.workspace]
      int   = 3000
      ext   = var.external_port["grafana"][terraform.workspace]

      volumes = [
        {
          container_path_each = "var/lib/grafana"
        },

        {
          container_path_each = "etc/grafana"
        }




      ]






      container_count = length(var.external_port["grafana"][terraform.workspace])
    }

  }



}

