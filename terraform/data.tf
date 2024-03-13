data "cloudflare_accounts" "gt_lab" {
  name = "gt-lab"
}

data "cloudflare_zone" "george_dev" {
  name = "george.dev"
}

data "cloudflare_zone" "simplelogin" {
  name = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
}
