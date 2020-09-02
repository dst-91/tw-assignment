terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

# New LAMP (all-in-one) instance
resource "aws_instance" "LAMP_instance" {
  ami            = var.redhat_ami
  instance_type  = var.server_instance_type
  key_name       = var.ssh_pri_key
  security_groups = ["${aws_security_group.app-sg.name}"]
}
resource "aws_security_group" "app-sg" {
        name            = "ssh_http_https"
        description     = "For web and ssh access"

        ingress {  #HTTP Port
                from_port       = 80
                to_port         = 80
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]
        }

        ingress {  #SSH Port
                from_port       = 22
                to_port         = 22
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]
        }

        ingress {  #HTTPS Port
                from_port       = 443
                to_port         = 443
                protocol        = "tcp"
                cidr_blocks     = ["0.0.0.0/0"]
        }

        ingress {  #ICMP Port
                from_port       = -1
                to_port         = -1
                protocol        = "ICMP"
                cidr_blocks     = ["0.0.0.0/0"]
        }
}
