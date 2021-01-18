output "certificate_id" {
  value = aws_acm_certificate.crt.id
}

output "certificate_arn" {
  value = aws_acm_certificate.crt.arn
}

output "certificate_domain" {
  value = aws_acm_certificate.crt.domain_name
}

output "zone_id" {
  value = element(data.aws_route53_zone.validation.*.zone_id, 1)
}

output "zone_name" {
  value = element(data.aws_route53_zone.validation.*.name, 1)
}

output "certificate_validation_id" {
  value = aws_acm_certificate_validation.crt.id
}
