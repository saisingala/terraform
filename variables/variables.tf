# 1. command line --> terraform plan instance_type = "t3.small"
# 2. terraform.tfvars
# 3. environment variables, TF_VAR_your_variable_name
# 4. default
# 5. prompt --> if you are not given any above option it will consider as prompt

variable "ami" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "Amazon Machine Image which is required to launch amazon"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "define the hardware configuration like cpu, memory,storage and network capacity"
}

variable "tags" {
    type = map #optional
    default = {
    Name = "backend"
    Project = "expense"
    Component = "backend"
    Environment = "DEV"
    Terraform = "true"
    }
    
}

variable "sg_name" {
    type = string
    default = "allow ssh"
}

variable "description" {
    type = string
    default = "allow ssh configuration in port 22"
}

variable "from_port" {
    type = number
    default = 22
}

variable "to_port" {
    type = number
    default = 22
}

variable "tcp" {
    type = string
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

