variable "private_key_path" {
  default = "my_key_pair"
}

variable "public_key_path" {
  default = "my_key_pair.pub"
}

resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.my_key_pair.private_key_pem
  filename = var.private_key_path
}

resource "local_file" "public_key_file" {
  content  = tls_private_key.my_key_pair.public_key_openssh
  filename = var.public_key_path
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = local_file.public_key_file.content
}

resource "null_resource" "set_key_permissions" {
  depends_on = [aws_key_pair.my_key_pair]

  triggers = {
    private_key = local_file.private_key_file.content
  }

  provisioner "local-exec" {
    command = "chmod 400 ${var.private_key_path}"
  }
}