#Create EC2 instance in private subnet and install Jenkins

resource "aws_instance" "ec2_jenkins" {
    ami = "ami-0e38b48473ea57778"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.private_subnet.id}"
    key_name               = "terraform-demo"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "ec2_jenkins_test"
      Environment       = "development"
      Project           = "ASPNETAPP"
    }
}

#Output
output "instance_id_list"     { value = ["${aws_instance.ec2_jenkins.*.id}"] }
