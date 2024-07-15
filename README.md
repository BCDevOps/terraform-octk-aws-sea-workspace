
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](./LICENSE) 

# AWS Workload Account Setup

This repo contains a Terraform module that is part of the tooling to provision a project team's accounts within an AWS Landing Zone.

This module is used in conjunction with other modules that provide other "layers" to project accounts within a landing zone.  The modules are orchestrated using a `terragrunt` configuration that is contained in a private repository.

## Third-Party Products/Libraries used and the licenses they are covered by

HashiCorp Terraform - [![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)

## Project Status
- [x] Development
- [ ] Production/Maintenance

# How To Use

Note: This module is intended to be used by another "root" module, or as part of a `terragrunt` "stack" rather than on its own.  It doesn't do much on its own.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_workspace"></a> [project\_workspace](#module\_project\_workspace) | github.com/BCDevOps/terraform-aws-sea-account-set.git | v0.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_email_domain"></a> [account\_email\_domain](#input\_account\_email\_domain) | Email domain to use when creating generated account email addresses. | `string` | `"cloud.gov.bc.ca"` | no |
| <a name="input_account_email_prefix"></a> [account\_email\_prefix](#input\_account\_email\_prefix) | Prefix to use when creating generated account email addresses. | `string` | n/a | yes |
| <a name="input_automation_role_name"></a> [automation\_role\_name](#input\_automation\_role\_name) | The name role to be assumed in the master account in order to allow creation of accounts within the organization. | `string` | n/a | yes |
| <a name="input_close_on_deletion"></a> [close\_on\_deletion](#input\_close\_on\_deletion) | true means that the account will be closed when it is deleted.  false means that the account be removed from the aws org when it is deleted. | `bool` | `false` | no |
| <a name="input_master_account_id"></a> [master\_account\_id](#input\_master\_account\_id) | Master Account Id | `string` | n/a | yes |
| <a name="input_org_admin_role_name"></a> [org\_admin\_role\_name](#input\_org\_admin\_role\_name) | The role name that will be created/set as the default cross-account admin role for accounts within an organization. | `string` | `"OrganizationAccountAccessRole"` | no |
| <a name="input_project_definition_file_path"></a> [project\_definition\_file\_path](#input\_project\_definition\_file\_path) | Full path to JSON file containing project definition structure. (project.json by convention) | `string` | `"project.json"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_account_ids"></a> [project\_account\_ids](#output\_project\_account\_ids) | n/a |
| <a name="output_project_accounts"></a> [project\_accounts](#output\_project\_accounts) | n/a |
<!-- END_TF_DOCS -->

## Getting Help or Reporting an Issue
<!--- Example below, modify accordingly --->
To report bugs/issues/feature requests, please file an [issue](../../issues).


## How to Contribute
<!--- Example below, modify accordingly --->
If you would like to contribute, please see our [CONTRIBUTING](./CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](./CODE_OF_CONDUCT.md). 
By participating in this project you agree to abide by its terms.


## License
    Copyright 2018 Province of British Columbia

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
