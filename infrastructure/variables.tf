provider "aws" {
          region = "${var.aws_region}"
          profile = "poc"
}

variable "region"{
          description = "Region Name"
          default = "eu-west-2"
}

variable "aws_region"{
          description = "EC2 Region for the VPC"
          default = "eu-west-2"
}

variable "vpc_cidr"{
          description = "CIDR for the whole vpc"
          default = "10.0.0.0/16"
}

variable "public_subnet_1"{
          description = "CIDR for the public 1 subnet"
          default = "10.0.0.0/25"
}

variable "private_subnet_1"{
          description = "CIDR for the public 1 subnet"
          default = "10.0.2.0/25"
}

variable "key_path"{
          description = "SSH Public Key path"
          default = "C:/Users/user_home/.ssh/id_rsa.pub"
}
