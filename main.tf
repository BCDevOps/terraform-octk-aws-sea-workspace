locals {
  project = merge(
    jsondecode(file(var.project_definition_file_path)), 
    {
      tags = merge(
        jsondecode(file(var.project_definition_file_path)).tags, 
        contains(keys(jsondecode(file(var.project_definition_file_path)).tags), "additional_contacts") ? 
        {
          "additional_contacts" = join("/", [for contact in jsondecode(file(var.project_definition_file_path)).tags.additional_contacts : contact.email])
        } : 
        {}
      )
    }
  )
}

module "project_workspace" {
  source               = "github.com/BCDevOps/terraform-aws-sea-account-set.git?ref=v0.1.0"
  project              = local.project
  org_admin_role_name  = var.org_admin_role_name
  account_email_prefix = var.account_email_prefix
  account_email_domain = var.account_email_domain
  close_on_deletion    = var.close_on_deletion
  master_account_id    = var.master_account_id
}

