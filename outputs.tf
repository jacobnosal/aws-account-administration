output "account_budget_id" {
  value = aws_budgets_budget.account_budget.id
}

output "account_budget_arn" {
  value = aws_budgets_budget.account_budget.arn
}

output "iac_user_access_key_id" {
  value     = aws_iam_access_key.iac_user_access_key.id
  sensitive = true
}

output "iac_user_access_key_secret" {
  value     = aws_iam_access_key.iac_user_access_key.secret
  sensitive = true
}