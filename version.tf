terraform {
  required_providers {
    logdna = {
      source  = "logdna/logdna"
      version = ">= 1.8.0"
    }
  }
  required_version = ">= 0.13"
}