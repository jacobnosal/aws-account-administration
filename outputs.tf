output "account_budget_id" {
  value = aws_budgets_budget.account_budget.id
}

output "account_budget_arn" {
  value = aws_budgets_budget.account_budget.arn
}

output "s3_budget_id" {
  value = aws_budgets_budget.s3_budget.id
}

output "s3_budget_arn" {
  value = aws_budgets_budget.s3_budget.arn
}