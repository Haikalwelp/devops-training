locals {
  bucket_created_file = "bucket_created.txt"
  first_run           = !fileexists(local.bucket_created_file)
}

resource "google_storage_bucket" "website_bucket" {
  count = local.first_run ? 1 : 0

  name          = "sispaa-revamp-website-bucket" # Replace with your bucket name
  location      = "asia-northeast1"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
  }

  provisioner "local-exec" {
    command = "echo 'Bucket created' > ${local.bucket_created_file}"
  }
}

resource "google_storage_bucket_object" "html" {
  name   = "index.html"
  bucket = local.first_run ? google_storage_bucket.website_bucket[0].name : "sispaa-revamp-website-bucket"
  source = "../src/index.html"
}

resource "google_storage_bucket_object" "js" {
  name   = "app.js"
  bucket = local.first_run ? google_storage_bucket.website_bucket[0].name : "sispaa-revamp-website-bucket"
  source = "../src/app.js"
}

resource "google_storage_bucket_object" "css" {
  name   = "style.css"
  bucket = local.first_run ? google_storage_bucket.website_bucket[0].name : "sispaa-revamp-website-bucket"
  source = "../src/style.css"
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = local.first_run ? google_storage_bucket.website_bucket[0].name : "sispaa-revamp-website-bucket"
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}