
output "master-node-ip" {
    value = aws_instance.master-node.public_ip  
}

output "worker-node-1-ip" {
    value = aws_instance.worker-node-1.public_ip
}

output "worker-node-2-ip" {
    value = aws_instance.worker-node-2.public_ip  
}

output "master-node-ssh" {
    value = "ssh -i my_key_pair ec2-user@${aws_instance.master-node.public_ip}"
}

output "worker-node-1-ssh" {
     value = "ssh -i my_key_pair ec2-user@${aws_instance.worker-node-1.public_ip}"
}

output "worker-node-2-ssh" {
     value = "ssh -i my_key_pair ec2-user@${aws_instance.worker-node-2.public_ip}"
}