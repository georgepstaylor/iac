resource "cloudflare_record" "george_dev_spf" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com include:amazonses.com ~all"
  zone_id = data.cloudflare_zone.george_dev.id
}
