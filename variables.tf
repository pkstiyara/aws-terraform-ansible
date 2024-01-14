
variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # Set your default AWS region here
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

###################################
# VPC
variable "vpc_name" {
  description = "name of the vpc"
  type = string
  default = "terraform-vpc"
}

variable "vpc_cidr" {
  description = "CIDR VPC"
  type = string
  default = "10.0.0.0/16"
  
}

## Public Subnet
variable "public-subnet-name" {
  description = "public_subnet_name"
  type = string
  default = "public-subnet"
}

# Subnet
variable "subnet_cidr" {
  description = "public-subnet-cidr"
  type = string
  default = "10.0.1.0/24" 
}

# Security Group
variable "sg-name" {
  description = "name of the security-group"
  type = string
  default = "terraform-sg"
}


# Instance Type
variable "instance_type" {
  description = "Instance_type"
  type = string
  default = "t2.micro"
}

####################################
# 
variable "node-1" {
  description = "Node 1 name"
  type = string 
  default = "node-1"
}

variable "node-2" {
  description = "node -2 name"
  type = string 
  default = "node-2"
}

variable "node-3" {
  description = "node - 3 name"
  type = string 
  default = "node-3"  
}