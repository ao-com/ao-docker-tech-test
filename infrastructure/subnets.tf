#Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_1}"
  availability_zone = "eu-west-2"
  
  tags {
    Name = "ASPNETAPP Public Subnet 1"
  }
}

#Output the Public Subnet id
output "aws_public_subnet_1" {
  value = "${aws_subnet.public-subnet.id}"
}

#Define the private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_1}"
  availability_zone = "eu-west-2"
  
  tags {
    Name = "ASPNETAPP Public Subnet 1"
  }
}

#Output the Private Subnet id
output "aws_private_subnet_1" {
  value = "${aws_subnet.private-subnet.id}"
}
