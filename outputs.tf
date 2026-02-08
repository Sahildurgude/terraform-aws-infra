output "my_ec2_instance_ip" {
  description = "Public IP of my Instance"
  value       = aws_instance.web.public_ip
}

output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.web.id
}

output "vpc_id" {
  description = "ID of my VPC"
  value       = aws_vpc.main.id
}

