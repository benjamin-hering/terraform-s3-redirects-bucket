output "bucket_website" {
  value = aws_s3_bucket.redirects_bucket.website
}

output "bucket_website_endpoint" {
  value = aws_s3_bucket.redirects_bucket.website_endpoint
}

output "bucket_website_domain" {
  value = aws_s3_bucket.redirects_bucket.website_domain
}
