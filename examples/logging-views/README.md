# Example - Log Analysis instance with default views

This example illustrates how to use the logging default views.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | >= 1.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_views"></a> [views](#module\_views) | we-work-in-the-cloud/logging-default-views/ibm |  |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.logdna](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_key.logdna_ingestion_key](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/resources/resource_key) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/ibm-cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key for IBM Cloud | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Prefix to use to create the example resources | `string` | `"logging-views"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where to deploy the example | `string` | `"us-south"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource group where to create resources | `string` | `null` | no |

## Outputs

No outputs.