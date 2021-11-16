variable "ibmcloud_api_key" {
  type        = string
  description = "API key for IBM Cloud"
}

variable "region" {
  type        = string
  default     = "us-south"
  description = "Region where to deploy the example"
}

variable "name" {
  type        = string
  default     = "logging-views"
  description = "Prefix to use to create the example resources"
}

variable "resource_group" {
  type        = string
  default     = null
  description = "Resource group where to create resources"
}
