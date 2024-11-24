resource "cloudflare_record" "george_dev_lab_wildcard" {
  name    = "*.lab"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = data.cloudflare_zone.george_dev.id
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

resource "cloudflare_record" "george_dev_lab" {
  name    = "lab"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = data.cloudflare_zone.george_dev.id
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

resource "cloudflare_record" "george_dev_tun" {
  name    = "tun"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = data.cloudflare_zone.george_dev.id
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

resource "cloudflare_record" "george_dev_photos" {
  name    = "photos"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "151.101.64.119"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_photos2" {
  name    = "photos"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "151.101.0.119"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_www_photos" {
  name    = "www.photos"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "151.101.64.119"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_www_photos2" {
  name    = "www.photos"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "151.101.0.119"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "protonmail_domainkey2" {
  name    = "protonmail2._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail2.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch."
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "protonmail_domainkey3" {
  name    = "protonmail3._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail3.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch."
  zone_id = data.cloudflare_zone.george_dev.id

}

resource "cloudflare_record" "protonmail_domainkey1" {
  name    = "protonmail._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail.domainkey.douf5apnlpzenx6anxzujpinvbyn5fyhfbybsu4oo3ejbb5vsuzrq.domains.proton.ch."
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

resource "cloudflare_record" "protonmail_dmarc" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "protonmail_spf" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch ~all"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "protonmail_verification" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=d87dd8341c600dc15ceaffa9a7fa0a47ca719575"
  zone_id = data.cloudflare_zone.george_dev.id
}


resource "cloudflare_record" "bsky_social_george_dev" {
  name  = "_atproto"
  type  = "TXT"
  value = "did=did:plc:hka5idgcdzfbfn6h2l65kc5g"
}
