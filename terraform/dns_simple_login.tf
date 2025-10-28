resource "cloudflare_record" "anonymous_domain_dkim" {
  for_each = {
    "dkim._domainkey"   = "dkim._domainkey.simplelogin.co.",
    "dkim02._domainkey" = "dkim02._domainkey.simplelogin.co.",
    "dkim03._domainkey" = "dkim03._domainkey.simplelogin.co.",
  }
  name    = each.key
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = each.value
  zone_id = data.cloudflare_zone.anonymous_domain.id
}

resource "cloudflare_record" "anonymous_domain_mx" {
  for_each = {
    "mx1.simplelogin.co." = 10
    "mx2.simplelogin.co." = 20
  }
  name     = var.ANONYMOUS_DOMAIN
  priority = each.value
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = each.key
  zone_id  = data.cloudflare_zone.anonymous_domain.id
}

resource "cloudflare_record" "anonymous_domain_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine; pct=100; adkim=s; aspf=s"
  zone_id = data.cloudflare_zone.anonymous_domain.id
}

resource "cloudflare_record" "anonymous_domain_spf" {
  name    = var.ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:simplelogin.co ~all"
  zone_id = data.cloudflare_zone.anonymous_domain.id
}
