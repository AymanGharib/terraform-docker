#external_port = [1880,1881,1882]

external_port = {
  nodered = {
    dev  = [1880]
    prod = [1980]
  }
  influxdb = {
    dev  = [8086]
    prod = [8087]
  }
  grafana = {
    dev  = [3000]
    prod = [3001]
  }
}