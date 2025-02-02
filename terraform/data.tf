data "cloudflare_accounts" "gt_lab" {
  name = "gt-lab"
}

data "cloudflare_zone" "george_dev" {
  name = "george.dev"
}

data "cloudflare_zone" "anonymous_domain" {
  name = var.ANONYMOUS_DOMAIN
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
