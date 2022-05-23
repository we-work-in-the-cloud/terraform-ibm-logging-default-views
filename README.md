# Default views for IBM Log Analysis

This modules creates default views for common services in an existing instance of IBM Log Analysis.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_logdna"></a> [logdna](#requirement\_logdna) | >= 1.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_logdna"></a> [logdna](#provider\_logdna) | >= 1.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [logdna_category.category](https://registry.terraform.io/providers/logdna/logdna/latest/docs/resources/category) | resource |
| [logdna_view.simple_view](https://registry.terraform.io/providers/logdna/logdna/latest/docs/resources/view) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_category_prefix"></a> [category\_prefix](#input\_category\_prefix) | Prefix to add to generated categories | `string` | `"IBM Cloud / "` | no |
| <a name="input_logging_api_key"></a> [logging\_api\_key](#input\_logging\_api\_key) | Service key to authenticate against the logging API | `string` | n/a | yes |
| <a name="input_logging_api_url"></a> [logging\_api\_url](#input\_logging\_api\_url) | API endpoint to use | `string` | `"https://api.us-south.logging.cloud.ibm.com"` | no |

## Outputs

No outputs.

## License

Apache 2 Licensed. See [LICENSE](LICENSE) for full details.
