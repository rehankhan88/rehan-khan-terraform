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
        to_prot
    }


    # outbound rule
    egress {

    
    }


    tags = {
        Name = "automate-sg        }
    
    }


# ec2 instance