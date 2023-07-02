# ==== Variables for App Engine application ==== #
variable "location_id" {}
variable "project" {}

# ===== Variables for App Engine AppService  ===== #
variable "app_service_version" {}
variable "app_service" {}
variable "app_service_runtime" {}
variable "app_service_threadsafe" {}
variable "app_service_instance_class {}
variable "app_service_zip" {}
variable "app_service_handlers" {}
variable "app_service_instances" {}
# ===== /Variables for App Engine App AppService ===== #

# ===== Variables for App Engine WebService ===== #
variable "web_service_version" {}
variable "web_service" {}
variable "web_service_runtime" {}
variable "web_service_threadsafe" {}
variable "web_service_instance_class {}
variable "web_service_zip" {}
variable "web_service_handlers" {}
variable "web_service_instances" {}
# ===== /Variables for App Engine WebService ===== #

# ===== Variables for App Engine DBService ===== #
variable "db_service_version" {}
variable "db_service" {}
variable "db_service_runtime" {}
variable "db_service_threadsafe" {}
variable "db_service_instance_class {}
variable "db_service_zip" {}
variable "db_service_handlers" {}
variable "db_service_instances" {}
# ===== /Variables for App Engine DBService ===== #

# Variables for Automatic Scaling
variable "automatic_scaling" {}