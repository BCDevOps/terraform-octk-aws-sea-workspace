
// the master account id.  this is required because the configuration will be run using credentials from a different account then assume a role in the master account.
variable "master_account_id" {
  type        = string
  description = "Master Account Id"
}


variable "automation_role_name" {
  type        = string
  description = "The name role to be assumed in the master account in order to allow creation of accounts within the organization."
}

variable "account_email_prefix" {
  type        = string
  description = "Prefix to use when creating generated account email addresses."
}
variable "account_email_domain" {
  default     = "cloud.gov.bc.ca"
  type        = string
  description = "Email domain to use when creating generated account email addresses."
}

variable "project_definition_file_path" {
  default     = "project.json"
  description = "Full path to JSON file containing project definition structure. (project.json by convention)"
  type        = string
}

variable "org_admin_role_name" {
  description = "The role name that will be created/set as the default cross-account admin role for accounts within an organization."
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "close_on_deletion" {
  description = "true means that the account will be closed when it is deleted.  false means that the account be removed from the aws org when it is deleted."
  type        = boolean
  default     = false
}
