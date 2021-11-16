variable "logging_api_key" {
  type        = string
  description = "Service key to authenticate against the logging API"
}

variable "logging_api_url" {
  type        = string
  description = "API endpoint to use"
  default     = "https://api.us-south.logging.cloud.ibm.com"
}
