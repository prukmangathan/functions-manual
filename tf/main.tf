terraform {
  backend "gcs" {
    bucket = "terraform-state-file-7482"
  }
}

provider "google" {
  region  = "us-central1"
  project = var.project_id
}

module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 2.2"
  project_id  = var.project_id
  names = [var.name]
  prefix = var.environment
}