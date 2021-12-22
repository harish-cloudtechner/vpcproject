variable "project"{
    type = string
}
variable "resource"{}
#variable "subnet"{
#}
#variable "nic"{}
variable "location"{
    type = string
    default = "westus"
}
variable "vnet-cidr"{}
#variable "mansubnet"{}
#variable "nic2"{}
#variable "lb_id"{}
#variable "lbpip"{}