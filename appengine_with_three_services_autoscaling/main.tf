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
  source            = "../modules/appservice/"
  service_version   = var.app_service_version
  service           = var.app_service
  runtime           = var.app_service_runtime
  threadsafe        = var.app_service_threadsafe
  instance_class    = var.app_service_instance_class
  zip               = var.app_service_zip
  handlers          = var.app_service_handlers
  instances         = var.app_service_instances
  automatic_scaling = var.automatic_scaling
}

module "web_service" {
  source            = "../modules/webservice/"
 service_version    = var.web_service_version
  service           = var.web_service
  runtime           = var.web_service_runtime
  threadsafe        = var.web_service_threadsafe
  instance_class    = var.web_service_instance_class
  zip               = var.web_service_zip
  handlers          = var.web_service_handlers
  instances         = var.web_service_instances
  automatic_scaling = var.automatic_scaling
}

module "db_service" {
  source            = "../modules/dbservice/"
  service_version   = var.db_service_version
  service           = var.db_service
  runtime           = var.db_service_runtime
  threadsafe        = var.db_service_threadsafe
  instance_class    = var.db_service_instance_class
  zip               = var.db_service_zip
  handlers          = var.db_service_handlers
  instances         = var.db_service_instances
  automatic_scaling = var.automatic_scaling
}