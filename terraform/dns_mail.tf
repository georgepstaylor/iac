resource "cloudflare_record" "george_dev_proton_verification" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=d87dd8341c600dc15ceaffa9a7fa0a47ca719575"
  zone_id = data.cloudflare_zone.george_dev.id
}
