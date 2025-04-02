variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 details"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Pem key name for connecting through ssh"
  type        = string
}

variable "allowed_ports" {
  description = "List of ports to allow for ssh and docker app"
  type        = list(number)
  default     = [22, 8081]
}


variable "egress_rules" {
  description = "List of egress port rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

