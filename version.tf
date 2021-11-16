terraform {
  required_providers {
    logdna = {
      source  = "logdna/logdna"
      version = ">= 1.7.0"
    }
  }
  required_version = ">= 0.13"
}