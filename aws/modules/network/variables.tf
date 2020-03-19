variable "name" {
  type    = string
  default = ""
}
variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "enable_dns_support" {
  type    = bool
  default = true
}
variable "enable_dns_hostnames" {
  type    = bool
  default = true
}
variable "enable_classiclink" {
  type    = bool
  default = false
}
variable "instance_tenancy" {
  type    = string
  default = "default"
}
variable "azs" {
  type        = list(string)
  default     = []
}
variable "public_subnet_suffix" {
  type        = string
  default     = "public"
}
variable "public_subnets" {
  type        = list(string)
  default     = []  
}
variable "map_public_ip_on_launch" {
  type    = bool
  default = true  
}
variable "private_subnet_suffix" {
  type        = string
  default     = "private"
}
variable "private_subnets" {
  type        = list(string)
  default     = []  
}
