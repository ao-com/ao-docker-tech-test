#Define the Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"
  
  tags {
    Name = "VPC IGW"
  }
}
