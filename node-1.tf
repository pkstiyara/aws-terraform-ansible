
# Amazon
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# # Red Hat 

# data "aws_ami" "latest_rhel" {
#   most_recent = true
#   owners      = ["309956199498"]  # Official Red Hat account ID

#   filter {
#     name   = "name"
#     values = ["RHEL-8*_HVM-*-x86_64-*"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
# }


resource "aws_instance" "node-1" {
    ami = data.aws_ami.latest_amazon_linux.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.k8s-sg.id]
    subnet_id = aws_subnet.main.id
    associate_public_ip_address = true
    key_name = aws_key_pair.my_key_pair.key_name
    root_block_device {
      volume_size = 50
    }

    
    tags = {
      Name = var.node-1
    }

    provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",  # Update the system using yum (for Amazon Linux)
        "sudo yum install -y wget vim git",
        
      ]
    }

    connection {
      type        = "ssh"
      user        = "ec2-user"  # The default user for Amazon Linux instances
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
 }
  