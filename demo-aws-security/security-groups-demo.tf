resource "aws_security_group" "good_example" {
  name        = "good-security-group"
  description = "Example of restricted SSH access"

  ingress {
    description = "SSH only from corporate IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.10/32"]
  }
}