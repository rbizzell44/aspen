### Usage
Baseline managed instance group currently used for bastion deployment.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| autoscaling | Enable autoscaling. | string | `"false"` | no |
| autoscaling\_cpu | Autoscaling, cpu utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#cpu_utilization | list | `<list>` | no |
| autoscaling\_lb | Autoscaling, load balancing utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#load_balancing_utilization | list | `<list>` | no |
| autoscaling\_metric | Autoscaling, metric policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#metric | list | `<list>` | no |
| compute\_image | Image used for compute VMs, in the pattern of project/family | string | n/a | yes |
| cooldown\_period | Autoscaling, cooldown period in seconds. | string | `"60"` | no |
| disk\_auto\_delete | Whether or not the disk should be auto-deleted. | string | `"true"` | no |
| disk\_size\_gb | The size of the image in gigabytes. If not specified, it will inherit the size of its base image. | string | `"0"` | no |
| disk\_type | The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard. | string | `"pd-ssd"` | no |
| labels | Map of labels to be used on all instances | map | n/a | yes |
| machine\_type | Machine type for the VMs in the instance group. | string | `"f1-micro"` | no |
| max\_replicas | Autoscaling, max replicas. | string | `"5"` | no |
| metadata | Map of metadata values to pass to instances. | map | `<map>` | no |
| min\_replicas | Autoscaling, min replics. | string | `"1"` | no |
| name | Name of the managed instance group and related resources, like the instance template. | string | n/a | yes |
| project\_id | Project ID of project to use for resources | string | n/a | yes |
| region | Region for cloud resources. | string | n/a | yes |
| rolling\_update\_policy | The rolling update policy. See https://www.terraform.io/docs/providers/google/r/compute_instance_group_manager.html#update_policy | map | `<map>` | no |
| service\_account\_email | The service account to use for all instances in this instance group. | string | `""` | no |
| service\_port | Port the service is listening on. | string | `"443"` | no |
| service\_port\_name | Name of the port the service is listening on. | string | `"ssl"` | no |
| size | Target size of the manged instance group. | string | `"1"` | no |
| startup\_script | Content of startup-script metadata passed to the instance template. | string | `""` | no |
| subnetwork | The subnetwork to deploy to | string | n/a | yes |
| subnetwork\_project | The project the subnetwork belongs to. If not set, the current project is used instead. | string | `""` | no |
| target\_tags | Tag added to instances for firewall and networking. | list | `<list>` | no |
| wait\_for\_instances | Wait for all instances to be created/updated before returning | string | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_group | Link to the `instance_group` property of the region instance group manager resource. |
| instances | List of instances in the instance group. Note that this can change dynamically depending on the current number of instances in the group and may be empty the first time read. |
| name | Pass through of input `name`. |
| service\_port | Pass through of input `service_port`. |
| service\_port\_name | Pass through of input `service_port_name`. |
| target\_tags | Pass through of input `target_tags`. |

