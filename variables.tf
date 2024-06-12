variable "domain_names" {
  description = "List of domain names in the certificate"
  type = list(object({
    record_name = string
    zone_name   = string
  }))
}
