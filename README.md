# aws-account-administration


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.account_budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_limit_amount"></a> [budget\_limit\_amount](#input\_budget\_limit\_amount) | (Required) The amount of cost or usage being measured for a budget. | `number` | `1` | no |
| <a name="input_budget_time_end"></a> [budget\_time\_end](#input\_budget\_time\_end) | (Optional) The end of the time period covered by the budget. There are no restrictions on the end date. Format: 2017-01-01\_12:00. | `string` | `"2050-08-01_00:00"` | no |
| <a name="input_budget_time_start"></a> [budget\_time\_start](#input\_budget\_time\_start) | (Optional) The start of the time period covered by the budget. If you don't specify a start date, AWS defaults to the start of your chosen time period. The start date must come before the end date. Format: 2017-01-01\_12:00. | `string` | `"2022-08-01_00:00"` | no |
| <a name="input_budget_time_unit"></a> [budget\_time\_unit](#input\_budget\_time\_unit) | (Required) The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY, and DAILY. | `string` | `"MONTH"` | no |
| <a name="input_notification_emails"></a> [notification\_emails](#input\_notification\_emails) | (Required) E-Mail addresses to notify. | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->