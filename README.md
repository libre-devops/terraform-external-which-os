```hcl
###############################################################################
# Detect the OS
###############################################################################

# Full path to the helper that exists only on Windows
locals {
  windows_helper = "${abspath(path.module)}\\printf.cmd"
}

# If the helper file exists, we’re on Windows; otherwise assume Linux
data "external" "detect_os" {
  program = fileexists(local.windows_helper) ? [local.windows_helper, "{\"os\":\"Windows\"}"] : ["printf", "{\"os\":\"Linux\"}"]
}

locals {
  os         = data.external.detect_os.result.os
  is_windows = lower(local.os) == "windows"
  is_linux   = lower(local.os) == "linux"
}

```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [external_external.detect_os](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_is_linux"></a> [is\_linux](#output\_is\_linux) | True if the OS is Linux |
| <a name="output_is_windows"></a> [is\_windows](#output\_is\_windows) | True if the OS is Windows |
| <a name="output_os"></a> [os](#output\_os) | The OS that is running the commands |
