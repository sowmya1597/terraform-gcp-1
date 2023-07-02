output "id" {
  description = "An identifier for the resource with format apps/{{project}}/services/{{service}}/versions/{{version_id}}"
  value       = module.appengine_app.id
}

output "name" {
  description = "Full path to the Version resource in the API. Example, `v1`."
  value       = module.appengine_app.name
}

output "app_id" {
  description = "Identifier of the app, usually {PROJECT_ID}."
  value       = module.appengine_app.app_id
}

output "url_dispatch_rule" {
  description = "A list of dispatch rule blocks. Each block has a domain, path, and service field."
  value       = module.appengine_app.url_dispatch_rule
}

output "code_bucket" {
  description = "The GCS bucket code is being stored in for this app."
  value       = module.appengine_app.code_bucket
}

output "default_hostname" {
  description = "The default hostname for this app."
  value       = module.appengine_app.default_hostname
}

output "default_bucket" {
  description = "The GCS bucket content is being stored in for this app."
  value       = module.appengine_app.default_bucket
}

output "gcr_domain" {
  description = "The GCR domain used for storing managed Docker images for this app."
  value       = module.appengine_app.gcr_domain
}

output "iap" {
  description = "Settings for enabling Cloud Identity Aware Proxy."
  value       = module.appengine_app.iap
}

output "iap_enabled" {
  description = "(Optional) Whether the serving infrastructure will authenticate and authorize all incoming requests. (default is false)"
  value       = length(module.appengine_app.iap) != 0 ? module.appengine_app.iap[0] : false
}

output "iap_oauth2_client_secret_sha256" {
  description = "Hex-encoded SHA-256 hash of the client secret."
  value       = length(module.appengine_app.iap) != 0 ? module.appengine_app.iap[1] : "IAP is not enabled for this app."
}



#Outputs for Cloud SQL sqlserver instance
output "self_link" {
  description = "A self link of the newly created Cloud SQL instance."
  value       = module.private_sqlserver_instance.self_link
}

output "sqlserver_connection_name" {
  description = "The connection name for the Cloud SQL instance created. It has the following format: `[PROJECT_ID]:[REGION]:[INSTANCE_NAME]` "
  value       = module.private_sqlserver_instance.connection_name
}

output "sqlserver_private_ip_address" {
  description = "The private IPv4 address assigned to the Cloud SQL instance created."
  value       = module.private_sqlserver_instance.private_ip_address
}

output "sqlserver_name" {
  description = "Name of the Cloud SQL instance. "
  value       = module.private_sqlserver_instance.name
}

#Outputs for Cloud SQL sqlserver Database

output "cloudsql_db_id" {
  description = "An identifier for the resource with format projects/{{project}}/instances/{{instance}}/databases/{{name}}"
  value       = module.cloud_sql_database.id
}

output "cloudsql_db_self_link" {
  description = "The URI of the created resource."
  value       = module.cloud_sql_database.self_link
}


# Outputs for SVPC connector module
output "svpc_connector_id" {
  value = module.svpc_connector.id
}

output "svpc_connector_state" {
  value = module.svpc_connector.state
}

output "svpc_connector_self_link" {
  value = module.svpc_connector.self_link
}

