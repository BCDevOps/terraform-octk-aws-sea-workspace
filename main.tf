locals {
  project = jsondecode(file(var.project_definition_file_path))
}

module "project_workspace" {
  source               = "github.com/BCDevOps/terraform-aws-sea-account-set.git?ref=v0.0.7"
  project              = local.project
  org_admin_role_name  = var.org_admin_role_name
  account_email_prefix = var.account_email_prefix
  account_email_domain = var.account_email_domain
  close_on_deletion    = var.close_on_deletion
}

