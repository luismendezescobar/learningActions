#it's based on the below articles
#https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/master/modules/gh-oidc
#https://github.com/marketplace/actions/authenticate-to-google-cloud

#First do the following commands in the shell

#gcloud services enable iam.googleapis.com
#gcloud services enable cloudresourcemanager.googleapis.com
#gcloud services enable iamcredentials.googleapis.com
#gcloud services enable sts.googleapis.com

#PROJECT_ID=triggering-a-198-1e8bbfa8
#gcloud iam service-accounts create "luis-service-account" \
#  --project "${PROJECT_ID}"
#gsutil mb gs://luis-10-22-2022
#echo "some file to see"> somefile.txt
#gsutil cp somefile.txt gs://luis-10-22-2022

locals {
  PROJECT="triggering-a-198-1e8bbfa8"  
}


module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = local.PROJECT
  pool_id     = "example-pool"
  provider_id = "example-gh-provider"
  sa_mapping = {
    "luis-service-account" = {
      sa_name   = "projects/${local.PROJECT}/serviceAccounts/luis-service-account@${local.PROJECT}.iam.gserviceaccount.com"
      attribute = "attribute.repository/luismendezescobar/learningActions"
    }
  }
}

output "module_output" {
  value = module.gh_oidc
}