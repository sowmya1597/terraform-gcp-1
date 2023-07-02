resource "google_vpc_access_connector" "serverless_vpc_connector" {
  name           = var.name
  region         = contains(data.google_compute_regions.available.names, var.region) == true ? var.region : data.google_compute_regions.available.names[17]
  ip_cidr_range  = var.ip_cidr_range
  network        = var.network
  min_throughput = (var.min_throughput < var.max_throughput) == true ? var.min_throughput : "The min_throughput value should be smaller than min_throughput"
  max_throughput = (var.max_throughput > var.min_throughput) == true ? var.max_throughput : "The max_throughput value should be bigger than max_throughput"
}