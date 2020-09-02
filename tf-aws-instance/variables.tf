variable "ssh_pri_key" {
        default         = "aws_generated"
        description     = "Private key pair for us-east-2(Ohio) region"
}

variable "server_instance_type" {
        default         = "t2.micro"
        description     = "Instance type"
}

variable "redhat_ami" {
        default         = "ami-0a54aef4ef3b5f881"
        description     = "Redhat AMI"
}

variable "region" {
        default         = "us-east-2"
        description     = "US east 2 region"
}
