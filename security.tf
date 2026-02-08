resource "aws_security_group" "web_sg" {
  name        = "terrform-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH Access"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTP Access"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    description = "Allow all outbound traffic"
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "terraform-web-sg"
  }
}
