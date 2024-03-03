resource "cloudflare_r2_bucket" "lab_backup" {
  account_id = data.cloudflare_accounts.gt_lab.accounts[0].id
  name       = "lab-backup"
  location   = "WEUR"
}
