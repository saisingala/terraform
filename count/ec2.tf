resource "aws_instance" "terraform" {
    count = length(var.instance_names) # here count = 3 is also possible 
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    # tags = {
    #     Name = var.instance_names[count.index]
    # }
    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow sshh"
    description = " allow port number 22 for SSH authentication"

    #usually we allow everything in egress
    egress {
        from_port = "0"
        to_port = "0"
        protocol = "-1"
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

    # tags = {
    #     Name = "allow sshh"
    # }

    tags = merge(
        var.common_tags,
        {
           Name = "allow sshh" 
        }
    )
}