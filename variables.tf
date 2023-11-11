variable "ami" {
  type        = string
  default     = "ami-0e8a34246278c21e4"
  description = "ami"
}

variable "instance_type" {
  type        = string
  default     = "t2.medium"
  description = "instance type"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "team" {
  type        = string
  default     = "alpha"
  description = "description"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "public subnet cidr"
}

variable "private_subnet_cidr" {
  type        = string
  default     = "10.0.2.0/24"
  description = "private subnet cidr"
}


