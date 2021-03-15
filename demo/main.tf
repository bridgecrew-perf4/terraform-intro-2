# Terraform, data/settings about itself
/*
terraform {
  required_providers {
    aws = "~> 3"
  }

  required_version = "= 0.14.7"
}
*/

# Providers, what APIs we want to interact with
/*
provider "aws" {
  region = "eu-west-1"
}
*/

# Resources, the things that will be created fo rus
/*
resource "aws_s3_bucket" "website" {
  bucket = "owc-demo-v1"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  tags = {
    kind = "demo"
  }
}
*/

# Locals, values that we'd rather reference than copy-paste around
# ...like variables, but they can't be set from the outside
/*
locals {
  title = "OWC Demo"
}
*/

# Placeholders for things :)
# Can be defaulted (like here) or set from the outside
/*
variable "greeting" {
  type    = string
  default = "How are y'all doing?"
}
*/

/*
resource "aws_s3_bucket_object" "object" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  content_type = "text/html"
  content      = <<EOF
<!doctype html>
<html>
  <head>
    <meta charset="utf-8"/>
    <title>OWC Demo</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
  </head>
  <body>
    <h1>Hello, OWC Community!</h1>
    <p>How are y'all doing? 👋<p>
  </body>
</html>
  EOF
}
*/

# Allowing the bucket to be read
/*
resource "aws_s3_bucket_policy" "can_be_read" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.public_can_read.json
}

# Creating the specific JSON document that AWS needs
# `data` can be read as many times as necessary. Its essentially read-only.
data "aws_iam_policy_document" "public_can_read" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.website.id}",
      "arn:aws:s3:::${aws_s3_bucket.website.id}/*"
    ]
  }
}
*/

# Outputs, interesting bits of data that we want to have printed
/*
output "url" {
  value = "https://${aws_s3_bucket.website.bucket_regional_domain_name}/index.html"
}
*/
