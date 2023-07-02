# ======================== DATA SOURCE DEFINITION ================= #

# It collects the different regions available within GCP.

data "google_compute_regions" "available" {
  # project = var.project_id
}

# ========================= VARIABLE DEFINITION =================== #

variable "name" {
  description = "Required) The name of the resource."
  type        = string
  default     = ""

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 25
    error_message = "The name of the Serverless VPC connector must be less than 25 characters long."
  }
}

variable "region" {
  description = "(Required; Default: europe-west2) Region where the VPC Access connector resides."
  type        = string
  default     = "europe-west2"
}

variable "ip_cidr_range" {
  description = "(Required) The range of internal addresses that follows RFC 4632 notation."
  type        = string
  default     = ""

  validation {
    condition     = length(regexall("^[[:digit:]]{1,3}.[[:digit:]]{1,3}.[[:digit:]]{1,3}.[[:digit:]]{1,3}/[2][8]$", var.ip_cidr_range)) > 0
    error_message = "IP range must be in CIDR notation(RFC 4632) and the CIDR block must be /28."
  }
}

variable "network" {
  description = "(Required) Name of a VPC network."
  type        = string
  default     = ""
}

variable "min_throughput" {
  description = "(Optional; Default: 200) Minimum throughput of the connector in Mbps."
  type        = number
  default     = 200

  validation {
    condition     = var.min_throughput >= 200 && var.min_throughput <= 900
    error_message = "Min throughput must be within range [200,900]."
  }
}

variable "max_throughput" {
  description = "(Optional; Default: 300) Maximum throughput of the connector in Mbps, must be greater than min_throughput."
  type        = number
  default     = 300

  validation {
    condition     = var.max_throughput >= 300 && var.max_throughput <= 1000
    error_message = "Max throughput must be within range [300,1000]."
  }
}
