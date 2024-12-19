Here is a basic example of how you can structure your Terraform code to create an Azure resource group, a virtual network, and a subnet. This example is modular, scalable, and includes variable files for configurations.

First, create a main.tf file:

```hcl
module "resource_group" {
  source  = "./modules/resource_group"
  name    = var.resource_group_name
  location = var.location
}

module "network" {
  source  = "./modules/network"
  name    = var.network_name
  location = var.location
  resource_group_name = module.resource_group.name
  address_space = var.address_space
}

module "subnet" {
  source  = "./modules/subnet"
  name    = var.subnet_name
  resource_group_name = module.resource_group.name
  virtual_network_name = module.network.name
  address_prefixes = var.address_prefixes
}
```

Then, create a variables.tf file:

```hcl
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "address_space" {
  description = "The address space of the network"
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes of the subnet"
  type        = list(string)
}
```

Finally, create an outputs.tf file:

```hcl
output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resource_group.id
}

output "network_id" {
  description = "The ID of the network"
  value       = module.network.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.subnet.id
}
```

This is a basic example and does not include the actual module code. You would need to create a modules directory and inside it, create directories for each module (resource_group, network, subnet) with their respective main.tf, variables.tf, and outputs.tf files. The main.tf file in each module directory would contain the actual resource creation code.