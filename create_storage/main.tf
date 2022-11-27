resource "random_string" "random" { 
  length  = 8
  special = false
}

resource "google_storage_bucket" "auto-expire" {
  name          = lower("test-bucket-${resource.random_string.random.result}")
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
