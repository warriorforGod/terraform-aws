variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "vpc_name" {
  description = "Value of the Name tag for the VPC."
  type        = string
  default     = "transit-vpc"
}

variable "sg_name" {
  description = "Value of the security group for the VPC."
  type        = string
  default     = "allow_ssh_sg"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        =  string
  default     = "transit_vpc_public_subnet"
}

variable "vpc_igw_name" {
  description = "Name of the internet gateway"
  type        = string
  default     = "transit_vpc_internet_gateway"
}

