output "id" {
  description = "An identifier for the Serverless VPC connector with format projects/{{project}}/locations/{{region}}/connectors/{{name}}"
  value       = google_vpc_access_connector.serverless_vpc_connector.id
}

output "state" {
  description = "State of the VPC access connector."
  value       = google_vpc_access_connector.serverless_vpc_connector.state
}

output "self_link" {
  description = "The fully qualified name of this VPC connector"
  value       = google_vpc_access_connector.serverless_vpc_connector.self_link
}