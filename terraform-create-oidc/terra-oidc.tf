#it's based on the below articles
#https://github.com/terraform-google-modules/terraform-google-github-actions-runners/tree/master/modules/gh-oidc
#https://github.com/marketplace/actions/authenticate-to-google-cloud

#First do the following commands in the shell

#gcloud services enable iam.googleapis.com
#gcloud services enable cloudresourcemanager.googleapis.com
#gcloud services enable iamcredentials.googleapis.com
#gcloud services enable sts.googleapis.com

#PROJECT_ID=playground-s-11-466b1a34
#gcloud iam service-accounts create "luis-service-account" \
#  --project "${PROJECT_ID}"
#gsutil mb gs://luis-10-24-2022
#echo "some file to see"> somefile.txt
#gsutil cp somefile.txt gs://luis-10-22-2022
#gcloud projects add-iam-policy-binding $PROJECT_ID \
#    --member serviceAccount:luis-service-account@$PROJECT_ID.iam.gserviceaccount.com \
#    --role roles/storage.admin

locals {
  PROJECT_ID="devops-369900"  
}


module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = local.PROJECT_ID
  pool_id     = "pool-for-iam-pipeline"
  provider_id = "iam-pipline-gh-provider"
  sa_mapping = {
    "luis-service-account" = {
      sa_name   = "projects/${local.PROJECT_ID}/serviceAccounts/luis-service-account@${local.PROJECT_ID}.iam.gserviceaccount.com"
      attribute = "attribute.repository/luismendezescobar/learningActions"
    }
  }
}

output "module_output" {
  value = module.gh_oidc
}

//Account for set iam permission 
#roles/resourcemanager.projectIamAdmin
#roles/iam.serviceAccountAdmin