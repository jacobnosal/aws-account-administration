resource "aws_iam_user" "iac_user" {
  name = "iac_user"
  path = "/"
}

resource "aws_iam_access_key" "iac_user_access_key" {
  user = aws_iam_user.iac_user.name
}

resource "aws_iam_user_group_membership" "iac_user__iac_contributor" {
  user   = aws_iam_user.iac_user.name
  groups = [aws_iam_group.aws_iac_contributor.name]
}