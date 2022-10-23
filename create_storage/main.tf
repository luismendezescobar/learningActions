resource "google_storage_bucket" "auto-expire" {
  name          = "create-bucket-10-22-2022"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}