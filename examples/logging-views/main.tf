terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.18.0"
    }
  }
  required_version = ">= 0.13"
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
}

# where to create resource, defaults to the default resource group
data "ibm_resource_group" "resource_group" {
  name       = var.resource_group
  is_default = var.resource_group == null ? true : null
}

# a sample instance
resource "ibm_resource_instance" "logdna" {
  name     = "${var.name}-instance"
  location = var.region

  service = "logdna"
  plan    = "lite"

  resource_group_id = data.ibm_resource_group.resource_group.id
}

# a resource key
resource "ibm_resource_key" "logdna_ingestion_key" {
  name                 = "${var.name}-key"
  resource_instance_id = ibm_resource_instance.logdna.id
  role                 = "Manager"
}

# and the default views for this instance
module "views" {
  source          = "we-work-in-the-cloud/logging-default-views/ibm"
  logging_api_key = ibm_resource_key.logdna_ingestion_key.credentials.service_key
  logging_api_url = "https://api.${var.region}.logging.cloud.ibm.com"
}