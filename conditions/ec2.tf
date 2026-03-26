resource "aws_instance" "terraform" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = var.environment == "prod" ? "t3.micro" : "t3.small" 
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = "terraform"
    }

}

resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow sshh"
    description = " allow port number 22 for SSH authentication"

    #usually we allow everything in egress
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1" # eqivalent to all
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow sshh"
    }
}