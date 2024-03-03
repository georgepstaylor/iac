resource "cloudflare_record" "terraform_managed_resource_c6bee13243413d5f91d0b906d4810dcf" {
  name    = "analytics"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_bcbb08cb76c564eec02f35db9383d0fb" {
  name    = "auth"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_93eb07e6ab5b9772cde9599d19658289" {
  name    = "george.dev"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_2e42435d1d1300d7149e5235f0dc03bd" {
  name    = "*.lab"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_8b9ba8c2ea97775e4c60a6c6e4ec8592" {
  name    = "lab"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "81.31.103.150"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_5aaeeea75e36547abb20599e3679c4a5" {
  name    = "local"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "10.10.1.2"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_5c1a4de59c27d84ef674dbde9e9b5fef" {
  name    = "photos"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "151.101.64.119"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_cb54101d9c66793decd55cd4c940058c" {
  name    = "photos"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "151.101.0.119"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_2653189fc62c7769d5379b68991baaf6" {
  name    = "tun"
  proxied = false
  ttl     = 1
  type    = "A"
  value   = "81.31.103.148"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_ee93855005e87351136de4d3a9c6dfef" {
  name    = "www.photos"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "151.101.64.119"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_c2ca96b9375105cd16c3bba092227d21" {
  name    = "www.photos"
  proxied = true
  ttl     = 1
  type    = "A"
  value   = "151.101.0.119"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_fc7682807a30a0c85ce76459b6db72fe" {
  name    = "protonmail2._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail2.domainkey.dzg5irlfkge6rv5b25egrnu3mfnmi7swylm4hen435gfaexb6o5ja.domains.proton.ch"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_4afed83be9f2f66fbb53c87fb300c042" {
  name    = "protonmail3._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail3.domainkey.dzg5irlfkge6rv5b25egrnu3mfnmi7swylm4hen435gfaexb6o5ja.domains.proton.ch"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_512b9e2acd32f60fc66c9860d02da069" {
  name    = "protonmail._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail.domainkey.dzg5irlfkge6rv5b25egrnu3mfnmi7swylm4hen435gfaexb6o5ja.domains.proton.ch"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_9c0310b4861e6b99bfbc55891f957e67" {
  name     = "george.dev"
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mailsec.protonmail.ch"
  zone_id  = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_a7935a6884d08ab48cb8395ca7b6de11" {
  name     = "george.dev"
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mail.protonmail.ch"
  zone_id  = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_cc230689d57b65ceb7a3108721ac13ab" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=quarantine"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_ef7fc47fa327a2a17184770bb0dca1e1" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch ~all"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "terraform_managed_resource_676fbcc5d0b1480c79bab7fe7f73d1c1" {
  name    = "george.dev"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=00798335617c9dab65dd8dedb6980d76846e97cb"
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}
