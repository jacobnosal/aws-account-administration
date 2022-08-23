resource "aws_budgets_budget" "account_budget" {
  name              = "monthly_account_budget"
  budget_type       = "COST"
  limit_amount      = var.budget_limit_amount
  limit_unit        = "USD"
  time_period_end   = var.budget_time_end
  time_period_start = var.budget_time_start
  time_unit         = var.budget_time_unit

  # Send a notification when actual spending reaches 80% of the limit.
  notification {
    comparison_operator        = "EQUAL_TO"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.notification_emails]
  }

  # Send a notification when actual spending reaches threshhold.
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.notification_emails]
  }

  # Send a notification when forecasted spending exceeds monthly limit.
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.notification_emails]
  }
}