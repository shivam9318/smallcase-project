aws_region    = "us-east-1"
instance_type = "t2.micro"
key_name      = "shivam"  # Replace with your actual EC2 key pair name

# Ingress ports you want open (accessible from 0.0.0.0/0)
allowed_ports = [22, 8081]

# Egress rules
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

