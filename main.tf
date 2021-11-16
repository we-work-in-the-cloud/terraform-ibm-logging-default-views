provider "logdna" {
  servicekey = var.logging_api_key
  url        = var.logging_api_url
}

locals {
  simple_views = [
    {
      category = "Compute️"
      name     = "Code Engine"
      query    = "host:\"Code Engine\""
    },
    {
      category = "Compute"
      name     = "Functions"
      query    = "host:functions"
    },
    {
      category = "Compute️"
      name     = "Cloud Foundry",
      query    = "host:cloudfoundry"
    },
    {
      category = "Compute️"
      name     = "Containers"
      query    = "host:containers-kubernetes"
    },
    {
      category = "Compute"
      name     = "Worker Nodes"
      query    = "tag:k8s"
    },
    {
      category = "Compute️"
      name     = "Container Registry"
      query    = "host:container-registry"
    },
    {
      category = "Compute️"
      name     = "Satellite"
      query    = "host:satellite"
    },
    {
      category = "Databases️"
      name     = "ICD"
      query    = "host:ibm-cloud-databases-prod"
    },
    {
      category = "Databases"
      name     = "Cloudant"
      query    = "host:cloudantnosqldb"
    },
    {
      category = "VPC"
      name     = "All"
      query    = "host:is"
    },
    {
      category = "VPC"
      name     = "VPN"
      query    = "host:is.vpn"
    },
    {
      category = "Security"
      name     = "Security Advisor"
      query    = "host:security-advisor"
    },
    {
      category = "Security"
      name     = "Certificate Manager"
      query    = "host:cloudcerts"
    },
    {
      category = "DevOps"
      name     = "Schematics"
      query    = "host:schematics"
    }
  ]
}

resource "logdna_view" "simple_view" {
  for_each = { for view in local.simple_views : view.name => view }
  name     = "${each.value.category} ~ ${each.value.name}"
  query    = each.value.query
}
