module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = "triggering-a-198-393873a0"
  pool_id     = "example-pool"
  provider_id = "example-gh-provider"
  sa_mapping = {
    "luis-service-account" = {
      sa_name   = "projects/triggering-a-198-393873a0/serviceAccounts/luis-service-account@triggering-a-198-393873a0.iam.gserviceaccount.com"
      attribute = "attribute.repository/luismendezescobar/learningActions"
    }
  }
}

output "module_output" {
  value = module.gh_oidc
}