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
  source        = "../modules/app"
  project       = var.project
  location_id   = var.location_id
}

module "app_service" {
  source            = "../modules/appservice/"
  service_version   = var.app_service_version_v1
  service           = var.app_service
  runtime           = var.runtime_v1
  threadsafe        = var.threadsafe_v1
  instance_class    = var.instance_class_v1
  zip               = var.zip_v1
  handlers          = var.handlers_v1
  automatic_scaling = var.automatic_scaling
}

module "web_service" {
  source            = "../modules/webservice/"
 service_version   = var.web_service_version_v2
  service           = var.web_service
  runtime           = var.runtime_v2
  threadsafe        = var.threadsafe_v2
  instance_class    = var.instance_class_v2
  zip               = var.zip_v2
  handlers          = var.handlers_v2
  automatic_scaling = var.automatic_scaling
}

module "db_service" {
  source            = "../modules/dbservice/"
  service_version   = var.db_service_version_v3
  service           = var.db_service_v3
  runtime           = var.runtime_v3
  threadsafe        = var.threadsafe_v3
  instance_class    = var.instance_class_v3
  zip               = var.zip_v3
  handlers          = var.handlers_v3
  automatic_scaling = var.automatic_scaling
}