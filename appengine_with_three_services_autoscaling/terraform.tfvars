# Variables for App Engine application
project       = "terraform-demo1"
location_id   = "us-central"

# ===== Variables for App Engine AppService ===== #
app_service_version             = "default-v1"
app_service_runtime             = "python27"
app_service_threadsafe          = true
app_service_instance_class      = "B1"
app_service_zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v1.zip"
  files_count = null
}
app_service_handlers = [{
  url_regex                   = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]
app_service_instances = 2
# ===== /Variables for App Engine AppService ===== #


# ===== Variables for App Engine WebService ===== #
web_service_version         = "default-v2"
web_service_runtime         = "python27"
web_service_threadsafe      = true
web_service_instance_class  = "B1"
web_service_zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v2.zip"
  files_count = null
}
web_service_handlers = [{
  url_regex                   = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]
web_service_instances = 3
# ===== /Variables for App Engine WebService ===== #

# ===== Variables for App Engine DBService ===== #
db_service_version         = "default-v2"
db_service_runtime         = "python27"
db_service_threadsafe      = true
db_service_instance_class  = "B1"
db_service_zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v2.zip"
  files_count = null
}
db_service_handlers = [{
  url_regex                   = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]
db_service_instances = 3
# ===== /Variables for App Engine DBService ===== #



### Variables definition for VPC network
vpc_network_name = "private-csql-vpc-sqlserver"
routing_mode     = "GLOBAL"

### Variables definition for IP address allocation range
allocated_ip_address_range_name = "private-ip-allocation-sqlserver"
prefix_length                   = 16

### Variables definition for Cloud SQL instance
instance_name    = "private-sqlserver-instance-real"
sql_region       = "europe-west1"
sqlserver_version = "SQLSERVER_2019_STANDARD"

## Variables definition for Cloud SQL user
sql_user_name = "cloud-sql-sqlserver-user"

## Variables declaration for Cloud SQL Database
database_name = "terraform-db"

# Variables for SVPC connector
svpc_connector_name = "sqlserver-svpc-connector"
ip_cidr_range       = "10.0.8.0/28"
region              = "us-central"
min_throughput      = 200
max_throughput      = 300

# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py37"
runtime         = "python37"
threadsafe      = true
instance_class  = "F1"

# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/gae-sqlserver-py27.zip"
  files_count = null
}

# Variables for Entrypoint block
entrypoint = {
  shell = "python main.py"
}

# Variables for Automatic Scaling module
automatic_scaling = {
  max_concurrent_requests = 10,
  max_idle_instances      = 10,
  max_pending_latency     = "1s",
  min_idle_instances      = 3,
  min_pending_latency     = "0.01s",
  standard_scheduler_settings = {
    target_cpu_utilization        = 0.6,
    target_throughput_utilization = 0.6,
    min_instances                 = 1,
    max_instances                 = 3
  }
}
