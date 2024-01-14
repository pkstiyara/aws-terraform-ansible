
output "node-1-ip" {
    value = aws_instance.node-1.public_ip 
}

output "node-1-ssh" {
    value = "ssh -i my_key_pair ec2-user@${aws_instance.node-1.public_ip}"
}


output "node-2-ip" {
    value = aws_instance.node-2.public_ip 
}

output "node-2-ssh" {
    value = "ssh -i my_key_pair ec2-user@${aws_instance.node-2.public_ip}"
}


output "node-3-ip" {
    value = aws_instance.node-1.public_ip 
}

output "node-3-ssh" {
    value = "ssh -i my_key_pair ec2-user@${aws_instance.node-3.public_ip}"
}
