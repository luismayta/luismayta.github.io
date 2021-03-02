## Requirements

| Name       | Version  |
| ---------- | -------- |
| terraform  | >=0.13   |
| aws        | >=3.25.0 |
| cloudflare | >=2.17.0 |
| github     | >=4.5.0  |
| local      | >=1.3.0  |
| null       | >=0.1.0  |
| template   | >=1.0.0  |
| tls        | >=2.1.1  |

## Providers

| Name | Version  |
| ---- | -------- |
| aws  | >=3.25.0 |

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | :-: |
| aws_region | n/a | `string` | n/a | yes |
| aws_vault | n/a | `string` | n/a | yes |
| cloudflare | vars for cloudflare | <pre>object({<br> token = string<br> user = string<br> })</pre> | n/a | yes |
| github | vars for github | <pre>object({<br> token = string<br> owner = string<br> })</pre> | n/a | yes |
| key_name | n/a | `string` | n/a | yes |
| keybase_path | n/a | `string` | n/a | yes |
| keybase_project_path | n/a | `string` | n/a | yes |
| keybase_team_path | n/a | `string` | n/a | yes |
| namespace | n/a | `string` | n/a | yes |
| project | n/a | `string` | n/a | yes |
| repository_domain | n/a | `string` | n/a | yes |
| repository_name | n/a | `string` | n/a | yes |
| repository_owner | n/a | `string` | n/a | yes |
| amis | AMIs by region | `map(any)` | <pre>{<br> "us-east-1": "ami-43a15f3e",<br> "us-west-2": "ami-0def3275"<br>}</pre> | no |
| availability_zone | The availability zone | `string` | `"us-east-1a"` | no |
| availability_zone_ebs | n/a | `string` | `"us-east-1a"` | no |
| aws_keys | keys pem and pub | `map(any)` | <pre>{<br> "pem": "/pem/luismayta.github.io-core.pem",<br> "pub": "/pub/luismayta.github.io-core.pub"<br>}</pre> | no |
| domain | n/a | `string` | `"luismayta.site"` | no |
| domains | domains | `map(any)` | <pre>{<br> "dev": "luismayta.site",<br> "prod": "luismayta.site"<br>}</pre> | no |
| instance_type | instances types | `map(any)` | <pre>{<br> "micro": "t2.micro",<br> "small": "t2.small"<br>}</pre> | no |
| stage | n/a | `string` | `"core"` | no |

## Outputs

No output.
