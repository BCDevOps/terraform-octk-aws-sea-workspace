locals {
  project_json = jsondecode(file(var.project_definition_file_path))

  project = merge(
    local.project_json,
    {
      tags = merge(
        local.project_json.tags,
        contains(keys(local.project_json.tags), "additional_contacts") ? {
          "additional_contacts" = join("/", [for contact in local.project_json.tags.additional_contacts : contact.email])
        } : {},
        contains(keys(local.project_json.tags), "expense_authority") ? {
          "expense_authority" = "${local.project_json.tags.expense_authority.name}/${local.project_json.tags.expense_authority.email}"
        } : {}
      )
    }
  )
}

module "project_workspace" {
  source               = "github.com/BCDevOps/terraform-aws-sea-account-set.git?ref=v0.3"
  project              = local.project
  org_admin_role_name  = var.org_admin_role_name
  account_email_prefix = var.account_email_prefix
  account_email_domain = var.account_email_domain
  close_on_deletion    = var.close_on_deletion
  master_account_id    = var.master_account_id
}

