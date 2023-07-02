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
  source        = "../../modules/app"
  project       = var.project
  location_id   = var.location_id
}

module "app_service" {
  source            = "../../modules/appservice/"
  service_version   = var.web_service_version
  service           = var.web_service
  runtime           = var.runtime
  threadsafe        = var.threadsafe
  instance_class    = var.instance_class
  zip               = var.zip
  handlers          = var.handlers
  automatic_scaling = var.automatic_scaling
}

module "web_service" {
  source            = "../../modules/webservice/"
  service_version   = var.db_service_version
  service           = var.db_service
  runtime           = var.runtime
  threadsafe        = var.threadsafe
  instance_class    = var.instance_class
  zip               = var.zip
  handlers          = var.handlers
  automatic_scaling = var.automatic_scaling
}

module "db_service" {
  source            = "../../modules/dbservice/"
  service_version   = var.db_service_version
  service           = var.db_service
  runtime           = var.runtime
  threadsafe        = var.threadsafe
  instance_class    = var.instance_class
  zip               = var.zip
  handlers          = var.handlers
  automatic_scaling = var.automatic_scaling
}