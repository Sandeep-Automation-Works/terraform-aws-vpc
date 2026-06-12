variable "project" {
    type = string 
}

variable "env" {
    type = string 
}

variable "vpc_cidr" {
    type = string 
    default = "13.0.0.0/16"
}

variable "tags" {
    type = map
    default = {}
}

variable "igw_tags" {
    type = map
    default = {}
}