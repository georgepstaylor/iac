resource "cloudflare_record" "anonymous_domain_dkim" {
  for_each = {
    "fm1._domainkey" = "fm1.${var.ANONYMOUS_DOMAIN}.dkim.fmhosted.com",
    "fm2._domainkey" = "fm2.${var.ANONYMOUS_DOMAIN}.dkim.fmhosted.com",
    "fm3._domainkey" = "fm3.${var.ANONYMOUS_DOMAIN}.dkim.fmhosted.com",
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
    "in1-smtp.messagingengine.com" = 10
    "in2-smtp.messagingengine.com" = 20
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
  value   = "v=DMARC1; p=quarantine"
  zone_id = data.cloudflare_zone.anonymous_domain.id
}

resource "cloudflare_record" "anonymous_domain_spf" {
  name    = var.ANONYMOUS_DOMAIN
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com ?all"
  zone_id = data.cloudflare_zone.anonymous_domain.id
}
