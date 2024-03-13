resource "cloudflare_record" "simplelogin_verification" {
  name    = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "sl-verification=qwmujktghmdbgjjlfrqmnabavbuvzu"
  zone_id = data.cloudflare_zone.simplelogin.id
}
