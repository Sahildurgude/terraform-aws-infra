resource "aws_instance" "web" {
  ami                         = "ami-0ff5003538b60d5ec"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = "terraform-key"

  user_data = <<-EOF
#!/bin/bash
yum update -y
yum install nginx -y
systemctl start nginx
systemctl enable nginx
echo "<h1>Deployed via Terraform</h1>" > /usr/share/nginx/html/index.html
EOF



  tags = {
    Name = "terraform-ec2"
  }

}

