terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
  required_version = "~> 1.7"

  backend "s3" {
    key    = "terraform.tfstate"
    # endpoints = {
    #   # https://XXXXXXX.r2.cloudflarestorage.com
    #   s3 = "<YOUR_ENDPOINT>"
    # }
    region = "auto"

    # access_key                  = "<YOUR_ACCESS_KEY>"
    # secret_key                  = "<YOUR_SECRET_KEY>"
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }

}
provider "cloudflare" {
  # token and email are set in the environment vars 
  # `CLOUDFLARE_EMAIL` and `CLOUDFLARE_API_TOKEN` respectively
}
