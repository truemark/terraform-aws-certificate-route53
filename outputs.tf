output "certificate_id" {
  value = aws_acm_certificate.crt.id
}

output "certificate_arn" {
  value = aws_acm_certificate.crt.arn
}

output "certificate_domain" {
  value = aws_acm_certificate.crt.domain_name
}
