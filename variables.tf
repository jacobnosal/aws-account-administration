variable "budget_limit_amount" {
  description = "(Required) The amount of cost or usage being measured for a budget."
  type        = number
  default     = 1
}

variable "budget_time_start" {
  description = "(Optional) The start of the time period covered by the budget. If you don't specify a start date, AWS defaults to the start of your chosen time period. The start date must come before the end date. Format: 2017-01-01_12:00."
  type        = string
  default     = "2022-08-01_00:00"
}

variable "budget_time_end" {
  description = "(Optional) The end of the time period covered by the budget. There are no restrictions on the end date. Format: 2017-01-01_12:00."
  type        = string
  default     = "2050-08-01_00:00"
}

variable "budget_time_unit" {
  description = "(Required) The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY, and DAILY."
  type        = string
  default     = "MONTHLY"
}

variable "notification_emails" {
  description = "(Required) E-Mail addresses to notify."
  type        = list(string)
}