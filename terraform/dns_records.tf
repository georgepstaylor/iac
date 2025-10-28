# Note: TTL = 1 means automatic TTL on cloudflare
resource "cloudflare_record" "bsky_social_george_dev" {
  name    = "_atproto"
  type    = "TXT"
  ttl     = 1
  proxied = false
  value   = "did=did:plc:hka5idgcdzfbfn6h2l65kc5g"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "status_george_dev" {
  name    = "status"
  type    = "CNAME"
  ttl     = 1
  proxied = true
  value   = "georgepstaylor.github.io"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "george_dev_cname" {
  name    = "@"
  type    = "CNAME"
  ttl     = 1
  proxied = true
  value   = "georgepstaylor.github.io"
  zone_id = data.cloudflare_zone.george_dev.id
}

# resource "cloudflare_record" "george_dev_ghp_a" {
#   for_each = toset(["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"])
#   name     = "@"
#   type     = "A"
#   ttl      = 1
#   proxied  = true
#   value    = each.key
#   zone_id  = data.cloudflare_zone.george_dev.id
# }

# resource "cloudflare_record" "george_dev_ghp_aaaa" {
#   for_each = toset(["2606:50c0:8000::153", "2606:50c0:8001::153", "2606:50c0:8002::153", "2606:50c0:8003::153"])
#   name     = "@"
#   type     = "AAAA"
#   ttl      = 1
#   proxied  = true
#   content  = ""
#   zone_id  = data.cloudflare_zone.george_dev.id
# }


resource "cloudflare_record" "www_george_dev_ghp_a" {
  name    = "www"
  type    = "A"
  ttl     = 1
  proxied = true
  content = "192.0.2.1" # dummy IP, cloudflare page rule will redirect to apex domain
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "www_george_dev_ghp_aaaa" {
  name    = "www"
  type    = "AAAA"
  ttl     = 1
  proxied = true
  content = "2001:db8::1" # dummy IP, cloudflare page rule will redirect to apex domain
  zone_id = data.cloudflare_zone.george_dev.id
}
