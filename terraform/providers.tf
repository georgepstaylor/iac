terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
   required_version = "~> 1.7"
}
provider "cloudflare" {
    # token and email are set in the environment vars 
    # `CLOUDFLARE_EMAIL` and `CLOUDFLARE_API_TOKEN` respectively
}
