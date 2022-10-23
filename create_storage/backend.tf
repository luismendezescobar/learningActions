terraform {
  backend "gcs" {
    bucket                      = "mystorage-10-22-2022"
    prefix                      = "create-storage/terraform-state"    
  }
}

