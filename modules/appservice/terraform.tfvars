# Variables for App Engine application
location_id   = "us-central"

# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py27"
runtime         = "python27"
threadsafe      = true
instance_class  = "F1"

# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/gae-helloworld.zip"
  files_count = null
}

# Variables for Handlers block
handlers = [{
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
    min_instances                 = 0,
    max_instances                 = 1
  }
}
handlers_v1 = [{
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
instances_v1 = 2
# ===== /Variables for App Engine Service V1 ===== #


# ===== Variables for App Engine Service V2 ===== #
service_version_v2 = "default-v2"
runtime_v2         = "python27"
threadsafe_v2      = true
instance_class_v2  = "B1"
zip_v2 = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v2.zip"
  files_count = null
}
handlers_v2 = [{
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
instances_v2 = 3
# ===== /Variables for App Engine Service V2 ===== #

# ===== Generic Variables ===== #
service = "default"