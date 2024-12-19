data "google_storage_bucket" "website_bucket" {
  name     = "sispaa-revamp-website-bucket" # Replace with your bucket name
}

resource "google_storage_bucket" "website_bucket" {
  name          = "sispaa-revamp-website-bucket" # Replace with your bucket name
  location      = "asia-northeast1"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
  }
}

resource "google_storage_bucket_object" "html" {
  name   = "index.html"
  bucket = data.google_storage_bucket.website_bucket.name
  source = "../src/index.html"
}

resource "google_storage_bucket_object" "js" {
  name   = "app.js"
  bucket = data.google_storage_bucket.website_bucket.name
  source = "../src/app.js"
}

resource "google_storage_bucket_object" "css" {
  name   = "style.css"
  bucket = data.google_storage_bucket.website_bucket.name
  source = "../src/style.css"
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = data.google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}