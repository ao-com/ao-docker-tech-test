#Create EC2 instance in private subnet, install Jenkins and docker-ce

resource "aws_instance" "ec2_jenkins" {
    ami = "ami-0e38b48473ea57778" 
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.private-subnet.id}"
    key_name = "${aws_key_pair.deployer.key_name}"
    count = 1
    associate_public_ip_address = true   
    connection {
    user = "ubuntu"
    key_file = "ssh/key"
    }
    provisioner "remote-exec" {
     inline = [
      "sudo apt-get update",
      "sudo apt-get install default-jdk -y",         
      "sudo apt-get install jenkins -y",
      "sudo systemctl start jenkins",
      "sudo systemctl status jenkins",
      "sudo ufw allow 8080"      
    ]
  }
  provisioner "remote-exec" {
   inline = [
      "sudo apt-get update",
      "sudo apt install apt-transport-https ca-certificates curl software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"",
      "sudo apt-get update",
      "apt-cache policy docker-ce"      
    ]
  }
  tags = {
      Name              = "ec2_jenkins_test"
      Environment       = "development"
      Project           = "ASPNETAPP"
  }
    
    
}

#Output
output "instance_id_list"     { value = ["${aws_instance.ec2_jenkins.*.id}"] }
