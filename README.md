# terraform-s3-redirects-bucket
Creates an S3 bucket website for URL re-directions and a simple method to manage adding custom URLs


## Quickstart

Two variables

`s3_domain_name` is the domain name you're redirecting from. This must be the DNS record for the domain you are redirecting from, with no procotol prefix. The module will create the correct S3 buckets accordingly. For example, `subdomain.example.com`

`urls_to_redirect` is a map of URL stems and their associated redirects. For example, adding

`"redirect1" = "https://blog.benjamin-hering.com"`will create an object in the S3 bucket at `subdomain.example.com/redirect1` and redirect it to `https://blog.benjamin-hering.com`

Folder structure is fine `"what/is/up/with+bsidessf+this+year" = "https://twitter.com/BSidesSF/status/1315095523179724800"` will create an object in the S3 bucket at `subdomain.example.com/what/is/up/with+bsidessf+this+year` and redirect it to `https://twitter.com/BSidesSF/status/1315095523179724800`

### Full Code Sample

```
module "custom_redirects" {
  source = "github.com/benjamin-hering/terraform-s3-redirects-bucket/redirects-bucket"
  s3_domain_name = "subdomain.example.com"
  urls_to_redirect = {
    "redirect1"                                = "https://blog.benjamin-hering.com"
    "what/is/up/with+bsidessf+this+year"       = "https://twitter.com/BSidesSF/status/1315095523179724800"
  }
}
```

### HTTP vs HTTPS
This module will setup the bucket and redirects, but S3 website hosting only works for HTTP. If a custom HTTPS redirect is needed, the bucket will have to be fronted with CloudFront / CloudFlare / or some other HTTPS termination service.
