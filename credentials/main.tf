terraform {
  required_providers {
    aws = "~> 3.4"
  }

  required_version = "= 0.13.2"
}

provider "aws" {
  region = "eu-west-1"
}

locals {
  name  = "demo-v1"
  group = "demo-days"
}

resource "aws_iam_user" "ci" {
  name          = local.name
  force_destroy = true
}

resource "aws_iam_user_policy_attachment" "can_be_admin" {
  user       = aws_iam_user.ci.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "ci" {
  user = aws_iam_user.ci.name
}

resource "aws_iam_group" "ci" {
  name = local.group
}

resource "aws_iam_user_group_membership" "ci" {
  user   = aws_iam_user.ci.name
  groups = [aws_iam_group.ci.name]
}


output "aws_access_key_id" {
  value = "export AWS_ACCESS_KEY_ID=${aws_iam_access_key.ci.id}"
}

output "aws_access_secret" {
  value = "export AWS_SECRET_ACCESS_KEY=${aws_iam_access_key.ci.secret}"
}


