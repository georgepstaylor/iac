resource "aws_ses_domain_identity" "ses_george_dev" {
  domain = "george.dev"
}

resource "cloudflare_record" "ses_george_dev" {
  name    = "_amazonses.ses"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = aws_ses_domain_identity.example.verification_token
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "aws_ses_domain_identity_verification" "ses_george_dev" {
  domain     = aws_ses_domain_identity.ses_george_dev.id
  depends_on = [cloudflare_record.ses_george_dev]
}

resource "aws_ses_domain_mail_from" "ses_george_dev" {
  domain           = aws_ses_domain_identity.example.domain
  mail_from_domain = aws_ses_domain_identity.example.domain
}

resource "cloudflare_record" "ses_george_dev" {
  name    = aws_ses_domain_mail_from.ses_george_dev.mail_from_domain
  proxied = false
  ttl     = 1
  type    = "MX"
  value   = "10 feedback-smtp.eu-west-2.amazonses.com"
  zone_id = data.cloudflare_zone.george_dev.id
}

resource "cloudflare_record" "ses_george_dev" {
  name    = aws_ses_domain_mail_from.ses_george_dev.mail_from_domain
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com ~all"
  zone_id = data.cloudflare_zone.george_dev.id
}
