terraform {
  backend "gcs" {
    bucket                      = "terraform-state-10-24-2022"
    prefix                      = "create-storage/terraform-state"    
  }
}

