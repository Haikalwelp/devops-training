terraform {
  backend "gcs" {
    bucket = "sispaa-revamp-terraform-state"
    prefix = "terraform/state"
  }
}

locals {
  bucket_name = "sispaa-revamp-website-bucket"
}

resource "google_storage_bucket" "website_bucket" {
  name          = local.bucket_name
  location      = "asia-northeast1"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
  }
}

resource "google_storage_bucket_object" "html" {
  name   = "index.html"
  bucket = google_storage_bucket.website_bucket.name
  source = "../src/index.html"
}

resource "google_storage_bucket_object" "js" {
  name   = "app.js"
  bucket = google_storage_bucket.website_bucket.name
  source = "../src/app.js"
}

resource "google_storage_bucket_object" "css" {
  name   = "style.css"
  bucket = google_storage_bucket.website_bucket.name
  source = "../src/style.css"
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}