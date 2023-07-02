# ==== Variables for App Engine application ==== #
variable "location_id" {}
variable "project" {}

# ===== Variables for App Engine AppService  ===== #
variable "app_service_version" {}
variable "app_service" {}
variable "app_service_runtime" {}
variable "app_service_threadsafe" {}
variable "app_service_instance_class" {}
variable "app_service_zip" {}
variable "app_service_handlers" {}
variable "app_service_instances" {}
# ===== /Variables for App Engine App AppService ===== #

# ===== Variables for App Engine WebService ===== #
variable "web_service_version" {}
variable "web_service" {}
variable "web_service_runtime" {}
variable "web_service_threadsafe" {}
variable "web_service_instance_class" {}
variable "web_service_zip" {}
variable "web_service_handlers" {}
variable "web_service_instances" {}
# ===== /Variables for App Engine WebService ===== #

# ===== Variables for App Engine DBService ===== #
variable "db_service_version" {}
variable "db_service" {}
variable "db_service_runtime" {}
variable "db_service_threadsafe" {}
variable "db_service_instance_class" {}
variable "db_service_zip" {}
variable "db_service_handlers" {}
variable "db_service_instances" {}
# ===== /Variables for App Engine DBService ===== #

# Variables for Automatic Scaling
variable "automatic_scaling" {}


### Variables declaration for VPC network
variable "vpc_network_name" {}
variable "routing_mode" {}

### Variables declaration for IP address allocation range
variable "allocated_ip_address_range_name" {}
variable "prefix_length" {}

### Variables declaration for Cloud SQL instance
variable "instance_name" {}
variable "sql_region" {}
variable "sqlserver_version" {}


## Variables declaration for Cloud SQL user
variable "sql_user_name" {}
variable "sql_user_password" {}

## Variables declaration for Cloud SQL Database
variable "database_name" {}

# Variables for SVPC connector block
variable "svpc_connector_name" {}
variable "ip_cidr_range" {}
variable "region" {}
variable "min_throughput" {}
variable "max_throughput" {}
# /Variables for SVPC connector block

# Variables for Standard Module
variable "service_version" {}
variable "service" {}
variable "runtime" {}
variable "threadsafe" {}
variable "instance_class" {}

# Variables for Zip Module
variable "zip" {}

# Variables for Entrypoint block
variable "entrypoint" {}

