
resource "aws_instance" "node-3" {
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
      Name = var.node-3
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
  