resource "aws_iam_group_policy" "tf_state_contributor" {
  name  = "tf_state_contributor"
  group = aws_iam_group.aws_iac_contributor.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:ListBucket",
        Resource = "arn:aws:s3:::tfstate-jnosal"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::tfstate-jnosal/*"
      }
    ]
  })
}

resource "aws_iam_group_policy" "budgets_contributor" {
  name  = "budgets_contributor"
  group = aws_iam_group.aws_iac_contributor.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "budgets:*"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "aws-portal:ViewBilling"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "iam:PassRole"
        ],
        Resource = "*",
        Condition = {
          StringEquals = {
            "iam:PassedToService" = "budgets.amazonaws.com"
          }
        }
      },
      {
        Effect = "Allow",
        Action = [
          "aws-portal:ModifyBilling",
          "ec2:DescribeInstances",
          "iam:ListGroups",
          "iam:ListPolicies",
          "iam:ListRoles",
          "iam:ListUsers",
          "organizations:ListAccounts",
          "organizations:ListOrganizationalUnitsForParent",
          "organizations:ListPolicies",
          "organizations:ListRoots",
          "rds:DescribeDBInstances",
          "sns:ListTopics"
        ],
        Resource = "*"
      }
    ]
  })
}

# For AWS Managed Polciies, list them with the cli to get the arn and use a data source to attach the policy.
data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "vpc_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

data "aws_iam_policy" "budget_actions_and_resource_access" {
  arn = "arn:aws:iam::aws:policy/AWSBudgetsActionsWithAWSResourceControlAccess"
}

resource "aws_iam_group" "aws_iac_contributor" {
  name = "aws_iac_contributor"
}

resource "aws_iam_group_policy_attachment" "ec2_full_access" {
  group      = aws_iam_group.aws_iac_contributor.name
  policy_arn = data.aws_iam_policy.ec2_full_access.arn
}

resource "aws_iam_group_policy_attachment" "vpc_full_access" {
  group      = aws_iam_group.aws_iac_contributor.name
  policy_arn = data.aws_iam_policy.vpc_full_access.arn
}