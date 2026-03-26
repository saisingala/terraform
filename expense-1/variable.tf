variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
  type    = string
  default = "Z0363538E2N8VXOVTCZY"
}

variable "domain_name" {
  default = "khaleja.fun"
}