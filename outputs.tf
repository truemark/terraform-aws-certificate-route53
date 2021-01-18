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
  value = data.aws_route53_zone.validation.zone_id
}

output "zone_name" {
  value = data.aws_route53_zone.validation.name
}

output "certificate_validation_id" {
  value = aws_acm_certificate_validation.crt.id
}
