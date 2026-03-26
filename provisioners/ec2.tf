resource "aws_instance" "terraform" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]

    tags = {
        Name = "terraform"
    }

    # my laptop or local machine
    provisioner "local-exec"{
        command = "echo ${self.private_ip} > private_ip.txt"
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }
    # provisioners will execute only at the time of creation
    provisioner "remote-exec" {
        # inline = [
        #     "sudo dnf install nginx -y",
        #     "sudo systemctl start nginx"
        # ]

        when = destroy
        inline = [
            "sudo systemctl stop nginx" #graceful shutdowndue to it will continue completing of all existed connections after it will shutdown
        ]
    }
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

    ingress {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow sshh"
    }
}