variable "urls_to_redirect" {
  type = map(string)
  description = "Map of old URI > place to redirect to"
  default = {
    "redirect1" = "https://blog.benjamin-hering.com"
    "redirect2" = "https://democratsabroad.atlassian.net"
  }
}

variable "s3_domain_name" {
  type = string
  description = "The domain name that this bucket will be hosted under and issue redirects from"
}