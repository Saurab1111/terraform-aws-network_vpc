variable "name" {
  type        = string
  description = "Name of the VPC."
  default     = "network-vpc"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for subnet placement."
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "alb_public_subnets" {
  type        = list(string)
  description = "Public subnets for internet-facing ALB."
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "web_private_subnets" {
  type        = list(string)
  description = "Private web tier subnets."
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "app_private_subnets" {
  type        = list(string)
  description = "Private app tier subnets."
  default     = ["10.0.20.0/24", "10.0.21.0/24"]
}

variable "db_private_subnets" {
  type        = list(string)
  description = "Private database tier subnets."
  default     = ["10.0.30.0/24", "10.0.31.0/24"]
}

variable "environment" {
  type        = string
  description = "Deployment environment."
  default     = "production"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags applied to resources."
  default = {
    ManagedBy = "Terraform"
    Service   = "network_vpc"
  }
}
