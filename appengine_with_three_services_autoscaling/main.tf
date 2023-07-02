terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "<= 3.49"
    }
  }
}

provider "google" {
  project = var.project
}

module "appengine_app" {
  source        = "../modules/appengine"
  project       = var.project
  location_id   = var.location_id
}

module "app_service" {
  source            = "../modules/appservice"
  project           = var.project
  service_version   = var.app_service_version
  service           = var.app_service
  runtime           = var.app_service_runtime
  threadsafe        = var.app_service_threadsafe
  instance_class    = var.app_service_instance_class
  zip               = var.app_service_zip
  handlers          = var.app_service_handlers
  automatic_scaling = var.automatic_scaling
}

module "web_service" {
  source            = "../modules/webservice"
  project           = var.project
  service_version    = var.web_service_version
  service           = var.web_service
  runtime           = var.web_service_runtime
  threadsafe        = var.web_service_threadsafe
  instance_class    = var.web_service_instance_class
  zip               = var.web_service_zip
  handlers          = var.web_service_handlers
  automatic_scaling = var.automatic_scaling
}

# ==== VPC network definition ==== #

module "vpc_network" {
  source           = "../modules/vpc/vpc_network"
  vpc_network_name = var.vpc_network_name
  vpc_description  = "VPC network created to house the CSQL instance private IP."
  routing_mode     = var.routing_mode
}

# ==== Allocated IP range definition ==== #

module "allocated_ip_address_range" {
  source                    = "../modules/vpc/allocated_ip_address_range"
  name                      = var.allocated_ip_address_range_name
  description               = "Allocation for the Cloud SQL instance."
  prefix_length             = var.prefix_length
  address_type              = "INTERNAL"
  purpose                   = "VPC_PEERING"
  associated_vpc_network_id = module.vpc_network.vpc_network_id

}

module "private_connection" {
  source                      = "../modules/vpc/private_connection"
  associated_vpc_network_id   = module.vpc_network.vpc_network_id
  allocated_ip_address_ranges = [module.allocated_ip_address_range.name]
}

module "private_sqlserver_instance" {

  # This is needed as we need to first peer with the service producer before assigning a private IP address with Cloud SQL.
  depends_on = [module.private_connection]

  source = "../modules/vpc/cloud_sql_sqlserver"
  name             = var.instance_name
  database_version = var.sqlserver_version
  cloud_sql_region = var.sql_region
  # We are disabling the Public IP from the Cloud SQL instance as
  # we only want to access it through private IP address.
  ipv4_enabled   = false
  vpc_network_id = module.vpc_network.vpc_network_id

}

# Second-generation instances include a default 'root'@'%' user with no password. 
#This user will be deleted by Terraform on instance creation. 
# Therefore, we will create a google_sql_user to define a custom user with a restricted host and strong password.

module "cloud_sql_user" {
  source = "../modules/vpc/cloud_sql_user"

  sql_user_name           = var.sql_user_name
  cloud_sql_instance_name = module.private_sqlserver_instance.name
  sql_user_password       = var.sql_user_password
}

# ==== Cloud SQL Database ==== #

module "cloud_sql_database" {
  depends_on    = [module.private_sqlserver_instance]
  source        = "../modules/vpc/cloud_sql_database"
  database_name = var.database_name
  instance_name = module.private_sqlserver_instance.name
}

# ==== Serverless VPC connector ==== #

module "svpc_connector" {
  depends_on     = [module.private_connection]
  source         = "../modules/vpc/serverless_vpc_connector"
  name           = var.svpc_connector_name
  network        = var.vpc_network_name
  ip_cidr_range  = var.ip_cidr_range
  region         = var.region
  min_throughput = var.min_throughput
  max_throughput = var.max_throughput
}

# ==== App Engine Standard Automatic Scaling ==== #

module "appengine_standard_automatic_scaling" {
  depends_on        = [module.private_sqlserver_instance, module.svpc_connector, module.cloud_sql_database]
  source            = "../modules/compute/standard/automatic_scaling/"
  service_version   = var.service_version
  service           = var.service
  runtime           = var.runtime
  threadsafe        = var.threadsafe
  env_variables     = { CLOUD_SQL_CONNECTION_NAME : module.private_sqlserver_instance.connection_name, DB_USER : var.sql_user_name, DB_PASS : var.sql_user_password, DB_NAME : var.database_name }
  instance_class    = var.instance_class
  zip               = var.zip
  entrypoint        = var.entrypoint
  automatic_scaling = var.automatic_scaling
  vpc_access_connector = {
    name = module.svpc_connector.id
  }
}