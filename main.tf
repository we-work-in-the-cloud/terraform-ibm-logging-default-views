provider "logdna" {
  servicekey = var.logging_api_key
  url        = var.logging_api_url
}

locals {
  simple_views = [
    //
    // COMPUTE
    //
    {
      category = "Compute️"
      name     = "Code Engine"
      query    = "host:\"Code Engine\""
    },
    {
      category = "Compute️"
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
      category = "Compute️"
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
    //
    // DATABASES
    //
    {
      category = "Databases️"
      name     = "ICD"
      query    = "host:ibm-cloud-databases-prod"
    },
    {
      category = "Databases️"
      name     = "Cloudant"
      query    = "host:cloudantnosqldb"
    },
    //
    // VPC
    //
    {
      category = "VPC"
      name     = "All"
      query    = "host:is"
    },
    {
      category = "VPC"
      name     = "VPC"
      query    = "action:\"is.vpc.\""
    },
    {
      category = "VPC"
      name     = "Block Storage"
      query    = "action:\"is.volume.\""
    },
    {
      category = "VPC"
      name     = "VSI"
      query    = "action:\"is.instance.\""
    },
    {
      category = "VPC"
      name     = "Image"
      query    = "action:\"is.image.\""
    },
    {
      category = "VPC"
      name     = "Load Balancer"
      query    = "host:is-load-balancer"
    },
    {
      category = "VPC"
      name     = "Flow Logs"
      query    = "action:\"is.flow-log-collector.\""
    },
    {
      category = "VPC"
      name     = "VPN"
      query    = "host:is.vpn"
    },
    //
    // Security
    //
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
      category = "Security"
      name     = "Compliance"
      query    = "host:compliance"
    },
    {
      category = "Security"
      name     = "Key Protect"
      query    = "host:kms"
    },
    //
    // Developer Tools
    //
    {
      category = "Tools"
      name     = "Schematics"
      query    = "host:schematics"
    },
    {
      category = "Tools"
      name     = "Cloud Shell"
      query    = "host:cloud-shell"
    },
    {
      category = "Tools"
      name     = "Continuous Delivery"
      query    = "host:continuous-delivery"
    },
    //
    // Observability
    //
    {
      category = "Observability"
      name     = "LogDNA"
      query    = "host:logdna"
    },
    //
    // Storage
    //
    {
      category = "Storage"
      name     = "COS"
      query    = "host:cloud-object-storage"
    }
  ]

  // capture all category names
  categories = distinct(flatten([
    for view in local.simple_views : view.category
  ]))
}

resource "logdna_category" "category" {
  for_each = { for category in local.categories : "${category}" => category }

  type = "views"
  name = "${var.category_prefix}${each.value}"
}

resource "logdna_view" "simple_view" {
  for_each   = { for view in local.simple_views : "${view.category}-${view.name}" => view }
  categories = [logdna_category.category[each.value.category].name]
  name       = each.value.name
  query      = each.value.query
}
