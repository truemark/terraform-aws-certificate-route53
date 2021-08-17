output "certificate_id" {
  description = "An identifying (ID) Amazon Resource Name (ARN) of the found certificate, suitable for referencing in other resources that support ACM certificates."
  value = aws_acm_certificate.crt.id
}

output "certificate_arn" {
  description = "A naming Amazon Resource Name (ARN) of the found certificate, suitable for referencing in other resources that support ACM certificates."
  value = aws_acm_certificate.crt.arn
}

output "certificate_domain" {
  description = "(Required) The domain of the certificate to look up. If no certificate is found with this name, an error will be returned."
  value = aws_acm_certificate.crt.domain_name
}

output "zone_id" {
  description = "The AWS Route53 Zone in which the zone field of this certificte is to be populated with."
  value = element(data.aws_route53_zone.validation.*.zone_id, 1)
}

output "zone_name" {
  description = "The name AWS Route53 Zone in which the name field of this certificte is to be populated with."
  value = element(data.aws_route53_zone.validation.*.name, 1)
}

output "certificate_validation_id" {
  description = "The value in id field of the acm_certificate_validation record. The id is the time at which the certificate was issued."
  value = aws_acm_certificate_validation.crt.id
}
