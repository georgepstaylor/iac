resource "cloudflare_record" "simplelogin_verification" {
  name    = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "sl-verification=qwmujktghmdbgjjlfrqmnabavbuvzu"
  zone_id = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_mx" {
  name     = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx1.simplelogin.co."
  zone_id  = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_mx2" {
  name     = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mx2.simplelogin.co."
  zone_id  = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_spf" {
  name    = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.simplelogin.co ~all"
  zone_id = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine"
  zone_id = data.cloudflare_zone.simplelogin.id
}
