#Define the Route Table for Public subbet
resource "aws_route_table" "public-rt" {
  vpc_id = "${aws_vpc.default.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags {
    Name = "Public Subnet RT"
  }
}

#Assign the Route Table to the Public Subnet
resource "aws_route_table_association" "public-rt1" {
  subnet_id = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.public-rt.id}"
}

#Define the Route Table fo Private subnet
resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.default.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gw1.id}"
  }
  tags {
    Name = "Private Subnet RT"
  }
}

#Assign the Route Table to the Private Subnet
resource "aws_route_table_association" "private-rt1" {
  subnet_id = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.private-rt.id}"
}
