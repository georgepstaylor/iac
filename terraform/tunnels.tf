# Tunnel with tunnel route
resource "cloudflare_tunnel" "lab" {
  account_id = data.cloudflare_accounts.gt_lab.accounts[0].id
  name       = "unraid"
  secret     = base64encode(random_string.lab_tunnel_secret.result)
}

resource "random_string" "lab_tunnel_secret" {
  length           = 32
  special          = true
  override_special = "_%@"
}

# output "tunnel_auth_token" {
#   value     = nonsensitive(cloudflare_tunnel.lab.tunnel_token)
#   sensitive = false
# }

resource "cloudflare_tunnel_route" "lab" {
  account_id         = data.cloudflare_accounts.gt_lab.accounts[0].id
  tunnel_id          = cloudflare_tunnel.lab.id
  network            = "10.10.0.0/16"
  comment            = "Tunnel to unraid docker container"
  virtual_network_id = cloudflare_tunnel_virtual_network.lab.id
}

resource "cloudflare_tunnel_virtual_network" "lab" {
  account_id = data.cloudflare_accounts.gt_lab.accounts[0].id
  name       = "lab"
}

resource "cloudflare_tunnel_config" "lab" {
  account_id = data.cloudflare_accounts.gt_lab.accounts[0].id
  tunnel_id  = cloudflare_tunnel.lab.id
  config {
    warp_routing {
      enabled = true
    }

    ingress_rule {
      service  = "http://10.10.2.1:2368"
      hostname = "george.dev"
    }
    ingress_rule {
      service  = "http://10.0.0.10:8000"
      hostname = "analytics.george.dev"
    }
    ingress_rule {
      service  = "http://10.0.0.10:8123"
      hostname = "ha.george.dev"
    }
    # ingress_rule {
    #   service  = "http://10.0.0.10:32400"
    #   hostname = "plex.george.dev"
    # }
    ingress_rule {
      service = "http://10.10.2.1:2368"
    }
  }
}

resource "cloudflare_record" "george_dev_ghost" {
  name    = "george.dev"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.lab.cname
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}


resource "cloudflare_record" "george_dev_analytics" {
  name    = "analytics"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.lab.cname
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

resource "cloudflare_record" "george_dev_ha" {
  name    = "ha"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = cloudflare_tunnel.lab.cname
  zone_id = "cce561dfc9c6775ac495f13cf8b76696"
}

# resource "cloudflare_record" "george_dev_plex" {
#   name    = "plex"
#   proxied = true
#   ttl     = 1
#   type    = "CNAME"
#   value   = cloudflare_tunnel.lab.cname
#   zone_id = "cce561dfc9c6775ac495f13cf8b76696"
# }
