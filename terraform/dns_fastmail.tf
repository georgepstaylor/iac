resource "cloudflare_record" "fastmail_dkim" {
  for_each = {
    "fm1._domainkey" = "fm1.george.dev.dkim.fmhosted.com",
    "fm2._domainkey" = "fm2.george.dev.dkim.fmhosted.com",
    "fm3._domainkey" = "fm3.george.dev.dkim.fmhosted.com",
  }
  name    = each.key
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = each.value
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_mx" {
  for_each = {
    "in1-smtp.messagingengine.com" = 10
    "in2-smtp.messagingengine.com" = 20
  }
  name     = "george.dev"
  priority = each.value
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = each.key
  zone_id  = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine"
  zone_id = data.cloudflare_zone.george_dev.id
}

