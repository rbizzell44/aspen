### Usage

Folder generation with log sink to bucket


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| audit\_bucket\_name | name of audit bucket | string | n/a | yes |
| folder\_name | name of folder | string | n/a | yes |
| folder\_sink\_name | name of sink for folders/projects | string | n/a | yes |
| log\_bucket\_location | where to put the log bucket geographically | string | n/a | yes |
| parent | parent to attach folder to | string | n/a | yes |
| project\_id | id of audit project | string | n/a | yes |
| severity\_level | logging level defaults to INFO | string | `"INFO"` | no |

## Outputs

| Name | Description |
|------|-------------|
| folder-number |  |

