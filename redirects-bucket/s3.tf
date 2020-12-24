resource "aws_s3_bucket" "redirects_bucket" {
  bucket = var.s3_domain_name
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "Redirects Bucket"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.redirects_bucket.id
  acl = "public-read"
  content_type = "text/html"
  key = "index.html"
  source = "${path.module}/files/index.html"
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.redirects_bucket.id
  acl = "public-read"
  content_type = "text/html"
  key = "error.html"
  source = "${path.module}/files/error.html"
}

resource "aws_s3_bucket_object" "redirects" {
  for_each = var.urls_to_redirect

  bucket           = aws_s3_bucket.redirects_bucket.id
  key              = each.key
  content          = "<meta http-equiv=\"refresh\" content=\"0; url=${each.value}\" />"
  content_type     = "text/html"
  acl              = "public-read"
  website_redirect = each.value
}