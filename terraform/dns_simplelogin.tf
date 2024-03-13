resource "cloudflare_record" "simplelogin_verification" {
  name    = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 60
  type    = "TXT"
  value   = "sl-verification=qwmujktghmdbgjjlfrqmnabavbuvzu"
  zone_id = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_mx" {
  name     = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  priority = 10
  proxied  = false
  ttl      = 600
  type     = "MX"
  value    = "mx1.simplelogin.co."
  zone_id  = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_mx2" {
  name     = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  priority = 20
  proxied  = false
  ttl      = 600
  type     = "MX"
  value    = "mx2.simplelogin.co."
  zone_id  = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_spf" {
  name    = var.SIMPLELOGIN_ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 600
  type    = "TXT"
  value   = "v=spf1 include:simplelogin.co ~all"
  zone_id = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "simplelogin_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 600
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"
  zone_id = data.cloudflare_zone.simplelogin.id
}

resource "cloudflare_record" "dkim" {
  count   = 3
  name    = count.index == 0 ? "dkim._domainkey" : "dkim0${count.index + 1}._domainkey"
  proxied = false
  ttl     = 600
  type    = "CNAME"
  value   = count.index == 0 ? "dkim._domainkey.simplelogin.co." : "dkim0${count.index + 1}._domainkey.simplelogin.co."
  zone_id = data.cloudflare_zone.simplelogin.id
}
