variable "instance_names" {
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "Dev"
        Terraform = "true"
    }
}

variable "zone_id" {
    type = string
    default = "Z0363538E2N8VXOVTCZY"
}

variable "domain_name" {
    default = "khaleja.fun"
}