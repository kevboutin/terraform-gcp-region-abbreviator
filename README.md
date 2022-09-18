# terraform-gcp-region-abbreviator
This terraform module provides a way to get a meaningful abbreviated version for a region in GCP.
For example, "useast-1" becomes "use1". This module also always outputs a map for every region, which allows you to do multiple at once.

This module does not communicate with AWS in any way.

## Usage

Basic usage of this module is as follows:

```hcl
module "utils" {
  source  = "terraform-gcp-region-abbreviator/utils/gcp"
  version = "~> 0.3"
  region  = "us-east1"
}

locals {
  "us-east1" = module.utils.region_short_name
}
```

The above results in locals with computed values of:

```
locals {
  "us-east1" = "use1"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_regions | A user-supplied list of regions to extend the lookup map. | `list(string)` | `[]` | no |
| region | The GCP region to retrieve a short name for (ex. `us-east1`). | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| region\_short\_name | The four to five character shortname of the region specified in var.region. |
| region\_short\_name\_map | The four to five character shortname of any given region. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] >= v0.12, < v0.14

### Service Account

A service account is not needed for to use this module.

### APIs

Projects/APIs are not required to use this module.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.
