resource "aws_instance" "expense" {
    for_each = var.instances # this variable is map and it will give a special variable as each
    ami = "ami-0220d79f3f480ecf5"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_sshh.id]

    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "allow_sshh" {
    name = "allow_sshh"
    description = "allow port 22 for ssh access"

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

    tags = {
        Name = "allow sshh"
    }
}