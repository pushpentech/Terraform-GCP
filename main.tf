resource "google_storage_bucket" "my-bucket" {
  name                     = "tt-githubdemo-bucket-000001"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
#
resource "google_storage_bucket" "my-bucket2" {
  name                     = "tt-githubdemo-bucket-000002"
  project                  = "test-terraform-438504"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
#
### dummy
