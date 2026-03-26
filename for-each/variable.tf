variable "instances" {
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    type = string
    default = "Z0363538E2N8VXOVTCZY"
}

variable "domain_name" {
    type = string
    default = "khaleja.fun"
}