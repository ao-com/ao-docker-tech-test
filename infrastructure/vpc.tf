#Define you VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostname = true
  
  tags {
    Name = "ASPNETAPP VPC"
  }
}
