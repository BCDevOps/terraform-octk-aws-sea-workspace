

output "project_accounts" {
  value = module.project_workspace.project_accounts
}

output "project_account_ids" {
  value = [for account in module.project_workspace.project_accounts : account.id]
}
