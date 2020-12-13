# AWS Certificate Route53 Terraform Module

This module will create a certificate using AWS ACM along with all route53 validation records.

Example Usage:
```hcl
    module "crt" {
      source = "truemark/certificate-route53/aws"
      domain_names = [
        {
          record_name = "*"
          zone_name = "example1.com"
        },
        {
          record_name = "*"
          zone_name = "example2.com"
        },
        {
          record_name = "*"
          zone_name = "example3.com"
        }
      ]
    }
``` 
