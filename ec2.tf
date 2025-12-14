# key pair (login)

resource "aws_key_pair" "deploy-key"{
    key_name = "rehan-key"
    public_key = file("rehan-key.pub")

# VPC & Security Group

resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_scurity_group" {
    
    name = "automate-sg"
    description = "this is my security group of tf"
    vpc_id = aws_default_vpc.default.id  # interpolation to get default vpc
    

    # inbound rule
    ingress {
        from_port = 22
        to_prot = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "ssh open"
    }
    ingress {
        from_port = 80
        to_prot = 80
        protoclo = "tcp"
        cidr_blocks = ["0.0.0.0/0]
        description = "http open"
    }
    ingress {
        from_port = 443
        to_prot = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
    }
    ingress {
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "django open"
    }


    # outbound rule
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all traffic allowed"

    
    }


    tags = {
        Name = "automate-sg        }
    
    }


# ec2 instance