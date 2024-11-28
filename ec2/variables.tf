variable "key_name" {
  type    = string
  default = "lamsutdeptraivcl"
}

variable "security_group" {}

variable "subnet" {}

variable "ami_free_amazon" {
  type    = string
  default = "ami-06b21ccaeff8cd686"
}

variable "ami_free_ubuntu" {
  type    = string
  default = "ami-0866a3c8686eaeeba"
}

variable "ami_free_windows" {
  type    = string
  default = "ami-0324a83b82023f0b3"
}

variable "instance_type_free" {
  type    = string
  default = "t2.micro"
}
