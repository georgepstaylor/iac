resource "cloudflare_record" "george_dev_dkim" {
  for_each = {
    "protonmail._domainkey"  = "protonmail.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch.",
    "protonmail2._domainkey" = "protonmail2.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch.",
    "protonmail3._domainkey" = "protonmail3.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch.",
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
    "mail.protonmail.ch"    = 10
    "mailsec.protonmail.ch" = 20
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


resource "cloudflare_record" "george_dev_proton_verification" {
  name    = "@"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=d87dd8341c600dc15ceaffa9a7fa0a47ca719575"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_spf" {
  name    = "@"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch ~all"
  zone_id = data.cloudflare_zone.george_dev.id
}
