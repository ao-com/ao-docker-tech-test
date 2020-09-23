#Define the public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_1}"
  availability_zone = "eu-west-2"
  
  tags {
    Name = "ASPNETAPP Public Subnet 1"
  }
}


#Define the public subnet
resource "aws_subnet" "private-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.private_subnet_1}"
  availability_zone = "eu-west-2"
  
  tags {
    Name = "ASPNETAPP Public Subnet 1"
  }
}
