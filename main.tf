locals {
  fqdns = [
    for d in var.domain_names:
      format("%s%s%s", d.record_name, d.record_name == "" ? "" : ".", d.zone_name)
  ]
}

resource "aws_acm_certificate" "crt" {
  domain_name       = "${var.domain_names[0].record_name}.${var.domain_names[0].zone_name}"
  validation_method = "DNS"

  subject_alternative_names = slice(local.fqdns, 1, length(local.fqdns))

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "validation" {
  count = length(var.domain_names)
  name = var.domain_names[count.index].zone_name
  private_zone = false
}

locals {
  zone_map = {
    for index, z in data.aws_route53_zone.validation:
      (element(local.fqdns, index)) => z.zone_id
    }
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.crt.domain_validation_options: dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
      domain = dvo.domain_name
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = lookup(local.zone_map, each.value.domain)
}

resource "aws_acm_certificate_validation" "crt" {
  certificate_arn         = aws_acm_certificate.crt.arn
  validation_record_fqdns = aws_acm_certificate.crt.domain_validation_options.*.resource_record_name
}
