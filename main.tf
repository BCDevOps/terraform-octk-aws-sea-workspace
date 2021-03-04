
provider "aws" {
	version = "~> 3.0"
	region = "ca-central-1"

	assume_role {
		role_arn = "arn:aws:iam::${var.master_account_id}:role/${var.automation_role_name}"
		session_name = "slz-terraform-automation"
	}
}


locals {
	project = jsondecode(file(var.project_definition_file_path))
}

module "project_workspace" {
	source = "github.com/BCDevOps/terraform-aws-sea-account-set.git?ref=v.0.0.2"
	project = local.project
	org_admin_role_name = var.org_admin_role_name
	account_email_prefix = var.account_email_prefix
	account_email_domain = var.account_email_domain
}

